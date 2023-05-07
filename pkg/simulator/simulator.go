package simulator

import (
	"context"
	"encoding/json"
	"fmt"
	"math"
	"math/rand"
	"sort"
	"sync"
	"time"

	log "github.com/sirupsen/logrus"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/client-go/informers"
	externalclientset "k8s.io/client-go/kubernetes"
	fakeclientset "k8s.io/client-go/kubernetes/fake"
	"k8s.io/client-go/tools/cache"
	"k8s.io/client-go/tools/clientcmd"
	"k8s.io/kubernetes/cmd/kube-scheduler/app/config"
	kubetypes "k8s.io/kubernetes/pkg/kubelet/types"
	"k8s.io/kubernetes/pkg/scheduler"
	"k8s.io/kubernetes/pkg/scheduler/framework"
	frameworkruntime "k8s.io/kubernetes/pkg/scheduler/framework/runtime"

	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/algo"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/api/v1alpha1"
	simonplugin "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/simulator/plugin"
	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	gpushareutils "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

// Simulator is used to simulate a cluster and pods scheduling
type Simulator struct {
	// kube client
	// externalclient  externalclientset.Interface
	client          externalclientset.Interface
	informerFactory informers.SharedInformerFactory

	// scheduler
	scheduler *scheduler.Scheduler

	// context
	ctx        context.Context
	cancelFunc context.CancelFunc

	status status

	//
	workloadPods    []*corev1.Pod
	typicalPods     simontype.TargetPodList
	skylinePods     simontype.SkylinePodList
	nodeResourceMap map[string]simontype.NodeResource
	customConfig    v1alpha1.CustomConfig
	fragMemo        sync.Map
	arrPodGpuMilli  int64

	podTotalMilliCpuReq int64
	podTotalMilliGpuReq int64
	nodeTotalMilliCpu   int64
	nodeTotalMilliGpu   int64
}

// status captures reason why one pod fails to be scheduled
type status struct {
	stopReason string
}

type simulatorOptions struct {
	kubeconfig      string
	schedulerConfig string
	customConfig    v1alpha1.CustomConfig
}

// Option configures a Simulator
type Option func(*simulatorOptions)

var defaultSimulatorOptions = simulatorOptions{
	kubeconfig:      "",
	schedulerConfig: "",
	customConfig:    v1alpha1.CustomConfig{},
}

// New generates all components that will be needed to simulate scheduling and returns a complete simulator
func New(opts ...Option) (Interface, error) {
	var err error
	// configure a simulator by opts
	options := defaultSimulatorOptions
	for _, opt := range opts {
		opt(&options)
	}

	// get scheduler config and set the list of scheduler bind plugins to the simulator
	kubeSchedulerConfig, err := GetAndSetSchedulerConfig(options.schedulerConfig)
	if err != nil {
		return nil, err
	}
	displaySchedulerConfig(kubeSchedulerConfig)

	// create a real/fake client
	var client externalclientset.Interface
	if options.kubeconfig != "" {
		varConfig, err := clientcmd.BuildConfigFromFlags("", options.kubeconfig)
		if err != nil {
			log.Errorf("%s\n", err.Error())
		}
		client, err = externalclientset.NewForConfig(varConfig)
	} else {
		client = fakeclientset.NewSimpleClientset()
	}
	kubeSchedulerConfig.Client = client
	sharedInformerFactory := informers.NewSharedInformerFactory(client, 0)

	// create a simulator
	ctx, cancel := context.WithCancel(context.Background())
	storagev1Informers := sharedInformerFactory.Storage().V1()
	scInformer := storagev1Informers.StorageClasses().Informer()
	sharedInformerFactory.Start(ctx.Done())
	cache.WaitForCacheSync(ctx.Done(), scInformer.HasSynced)

	sim := &Simulator{
		client:          client,
		informerFactory: sharedInformerFactory,
		ctx:             ctx,
		cancelFunc:      cancel,
		customConfig:    options.customConfig,
	}

	// create a scheduler
	bindRegistry := frameworkruntime.Registry{
		simontype.SimonPluginName: func(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
			return simonplugin.NewSimonPlugin(configuration, handle)
		},
		simontype.OpenGpuSharePluginName: func(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
			return simonplugin.NewGpuSharePlugin(configuration, handle, &sim.typicalPods)
		},
		simontype.RandomScorePluginName: func(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
			return simonplugin.NewRandomScorePlugin(configuration, handle)
		},
		simontype.DotProductScorePluginName: func(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
			return simonplugin.NewDotProductScorePlugin(configuration, handle)
		},
		simontype.GpuClusteringScorePluginName: func(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
			return simonplugin.NewGpuClusteringScorePlugin(configuration, handle)
		},
		simontype.GpuPackingScorePluginName: func(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
			return simonplugin.NewGpuPackingScorePlugin(configuration, handle)
		},
		simontype.BestFitScorePluginName: func(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
			return simonplugin.NewBestFitScorePlugin(configuration, handle)
		},
		simontype.FGDScorePluginName: func(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
			return simonplugin.NewFGDScorePlugin(configuration, handle, &sim.typicalPods)
		},
	}
	sim.scheduler, err = scheduler.New(
		sim.client,
		sim.informerFactory,
		GetRecorderFactory(kubeSchedulerConfig),
		sim.ctx.Done(),
		scheduler.WithProfiles(kubeSchedulerConfig.ComponentConfig.Profiles...),
		scheduler.WithAlgorithmSource(kubeSchedulerConfig.ComponentConfig.AlgorithmSource),
		scheduler.WithPercentageOfNodesToScore(kubeSchedulerConfig.ComponentConfig.PercentageOfNodesToScore),
		scheduler.WithFrameworkOutOfTreeRegistry(bindRegistry),
		scheduler.WithPodMaxBackoffSeconds(kubeSchedulerConfig.ComponentConfig.PodMaxBackoffSeconds),
		scheduler.WithPodInitialBackoffSeconds(kubeSchedulerConfig.ComponentConfig.PodInitialBackoffSeconds),
		scheduler.WithExtenders(kubeSchedulerConfig.ComponentConfig.Extenders...),
	)
	if err != nil {
		return nil, err
	}

	return sim, nil
}

// RunCluster with real client in a production cluster or fake client in a simulated cluster.
func (sim *Simulator) RunCluster(cluster ResourceTypes) ([]simontype.UnscheduledPod, error) {
	// start scheduler
	sim.runScheduler()

	switch t := sim.client.(type) {
	case *externalclientset.Clientset:
		return nil, nil
	case *fakeclientset.Clientset:
		return sim.syncClusterResourceList(cluster)
	default:
		return nil, fmt.Errorf("unknown client type: %T", t)
	}
}

func (sim *Simulator) ScheduleApp(apps AppResource) ([]simontype.UnscheduledPod, error) {
	// 由 AppResource 生成 Pods
	appPods, err := GenerateValidPodsFromAppResources(sim.client, apps.Name, apps.Resource)
	if err != nil {
		return nil, err
	}
	affinityPriority := algo.NewAffinityQueue(appPods)
	sort.Sort(affinityPriority)
	tolerationPriority := algo.NewTolerationQueue(appPods)
	sort.Sort(tolerationPriority)
	failedPod := sim.SchedulePods(appPods)

	return failedPod, nil
}

func (sim *Simulator) GetCustomConfig() v1alpha1.CustomConfig {
	return sim.customConfig
}

func (sim *Simulator) GetClusterNodeStatus() []simontype.NodeStatus {
	var nodeStatues []simontype.NodeStatus
	var err error

	nodes, err := sim.client.CoreV1().Nodes().List(sim.ctx, metav1.ListOptions{})
	if err != nil {
		return nil
	}
	pods, err := sim.client.CoreV1().Pods(corev1.NamespaceAll).List(sim.ctx, metav1.ListOptions{})
	if err != nil {
		return nil
	}
	nodeToPodListMap := map[string][]*corev1.Pod{}
	for _, pod := range pods.Items {
		nodeName := pod.Spec.NodeName
		if nodeName != "" {
			if nodeToPodListMap[nodeName] == nil {
				nodeToPodListMap[nodeName] = []*corev1.Pod{}
			}
			nodeToPodListMap[nodeName] = append(nodeToPodListMap[nodeName], pod.DeepCopy())
		}
	}

	for _, node := range nodes.Items {
		nodeStatus := simontype.NodeStatus{}
		nodeStatus.Node = node.DeepCopy()
		nodeStatus.Pods = nodeToPodListMap[node.Name]
		nodeStatues = append(nodeStatues, nodeStatus)
	}
	return nodeStatues
}

// runScheduler
func (sim *Simulator) runScheduler() {
	// Step 1: start all informers.
	sim.informerFactory.Start(sim.ctx.Done())
	sim.informerFactory.WaitForCacheSync(sim.ctx.Done())

	// Step 2: run scheduler
	go func() {
		sim.scheduler.Run(sim.ctx)
	}()
}

func (sim *Simulator) createPod(p *corev1.Pod) error {
	if _, err := sim.client.CoreV1().Pods(p.Namespace).Create(sim.ctx, p, metav1.CreateOptions{}); err != nil {
		return fmt.Errorf("%s(%s): %s", simontype.CreatePodError, utils.GeneratePodKey(p), err.Error())
	}

	// synchronization
	sim.syncPodCreate(p.Namespace, p.Name, 2*time.Millisecond)
	pod, _ := sim.client.CoreV1().Pods(p.Namespace).Get(sim.ctx, p.Name, metav1.GetOptions{})
	if pod != nil {
		if pod.Spec.NodeName != "" {
			sim.syncNodeUpdateOnPodCreate(pod.Spec.NodeName, pod, 2*time.Millisecond)
			log.Infof("pod(%s) is scheduled to node(%s)\n", utils.GeneratePodKey(pod), pod.Spec.NodeName)
		}
	} else {
		log.Errorf("[createPod] pod(%s) not created, should not happen", utils.GeneratePodKey(p))
	}
	return nil
}

func (sim *Simulator) deletePod(p *corev1.Pod) error {
	pod, _ := sim.client.CoreV1().Pods(p.Namespace).Get(sim.ctx, p.Name, metav1.GetOptions{})
	nodeName := ""
	if pod != nil {
		nodeName = pod.Spec.NodeName
	} else {
		log.Debugf("[deletePod] attempt to delete a non-existed pod(%s)\n", utils.GeneratePodKey(p))
		return nil
	}

	// delete the pod
	if err := sim.client.CoreV1().Pods(p.Namespace).Delete(sim.ctx, p.Name, metav1.DeleteOptions{}); err != nil {
		return fmt.Errorf("%s(%s): %s", simontype.DeletePodError, utils.GeneratePodKey(p), err.Error())
	}

	// synchronization
	sim.syncPodDelete(p.Namespace, p.Name, 500*time.Microsecond)
	if nodeName != "" {
		sim.syncNodeUpdateOnPodDelete(nodeName, pod, 2*time.Millisecond)
	} else {
		log.Infof("[deletePod] attempt to delete a non-scheduled pod(%s)\n", utils.GeneratePodKey(p))
	}
	return nil
}

func (sim *Simulator) assumePod(pod *corev1.Pod) *simontype.UnscheduledPod {
	err := sim.createPod(pod)
	if err != nil || sim.isPodUnscheduled(pod.Namespace, pod.Name) {
		if err = sim.deletePod(pod); err != nil {
			log.Errorf("[assumePod] failed to delete pod(%s)\n", utils.GeneratePodKey(pod))
		}
		return &simontype.UnscheduledPod{Pod: pod}
	}
	return nil
}

func (sim *Simulator) SchedulePods(pods []*corev1.Pod) []simontype.UnscheduledPod {
	var failedPods []simontype.UnscheduledPod
	sim.arrPodGpuMilli = 0
	for i, pod := range pods {
		if IsPodMarkedUnscheduledAnno(pod) {
			log.Infof("[%d] pod(%s) has unscheduled annotation\n", i, utils.GeneratePodKey(pod))
			failedPods = append(failedPods, simontype.UnscheduledPod{
				Pod:    pod,
				Reason: fmt.Sprintf("pod(%s) has unscheduled annotation", utils.GeneratePodKey(pod)),
			})
			continue
		}

		deletionTime := gpushareutils.GetDeletionTimeFromPodAnnotation(pod)
		if deletionTime == nil {
			podRes := utils.GetPodResource(pod)
			sim.arrPodGpuMilli += podRes.TotalMilliGpu()
			log.Infof("[%d] attempt to create pod(%s)\n", i, utils.GeneratePodKey(pod))
			if unscheduledPod := sim.assumePod(pod); unscheduledPod != nil {
				log.Infof("[%d] failed to schedule pod(%s): %s\n", i, utils.GeneratePodKey(pod), utils.GetPodResource(pod).Repr())
				failedPods = append(failedPods, *unscheduledPod)
			}
		} else {
			log.Infof("[%d] attempt to delete pod(%s)\n", i, utils.GeneratePodKey(pod))
			if err := sim.deletePod(pod); err != nil {
				log.Errorf("failed to delete pod(%s)\n", utils.GeneratePodKey(pod))
			}
		}
		sim.ClusterGpuFragReport()
		// sim.ReportFragBasedOnSkyline()
	}
	return failedPods
}

func (sim *Simulator) Close() {
	sim.cancelFunc()
}

func (sim *Simulator) isPodScheduled(ns, name string) bool {
	pod, _ := sim.client.CoreV1().Pods(ns).Get(sim.ctx, name, metav1.GetOptions{})
	return pod != nil && pod.Spec.NodeName != ""
}

func (sim *Simulator) isPodUnscheduled(ns, name string) bool {
	pod, _ := sim.client.CoreV1().Pods(ns).Get(sim.ctx, name, metav1.GetOptions{})
	if pod != nil && pod.Spec.NodeName == "" {
		for _, condition := range pod.Status.Conditions {
			if condition.Type == corev1.PodScheduled && condition.Status == corev1.ConditionFalse &&
				condition.Reason == corev1.PodReasonUnschedulable {
				return true
			}
		}
	}
	return false
}

func (sim *Simulator) isPodCreated(ns, name string) bool {
	return sim.isPodScheduled(ns, name) || sim.isPodUnscheduled(ns, name)
}

func (sim *Simulator) isPodDeleted(ns, name string) bool {
	pod, _ := sim.client.CoreV1().Pods(ns).Get(sim.ctx, name, metav1.GetOptions{})
	return pod == nil || (pod.Namespace == "" && pod.Name == "")
}

func (sim *Simulator) isNodeCreated(name string) bool {
	node, _ := sim.client.CoreV1().Nodes().Get(sim.ctx, name, metav1.GetOptions{})
	return node != nil
}

func (sim *Simulator) isPodFoundInNodeGpuAnno(node *corev1.Node, p *corev1.Pod) bool {
	gpuNodeInfoStr, err := utils.GetGpuNodeInfoFromAnnotation(node)
	if err != nil {
		panic(fmt.Sprintf("failed to parse gpu info annotation on node(%s): %v", node.Name, err.Error()))
	}
	if gpuNodeInfoStr == nil {
		panic(fmt.Sprintf("gpu node(%s) don't have gpu annotation, should not happen", node.Name))
	}

	for _, dev := range gpuNodeInfoStr.DevsBrief {
		for _, pStr := range dev.PodList {
			if utils.GeneratePodKey(p) == pStr {
				return true
			}
		}
	}
	return false
}

func (sim *Simulator) syncPodCreate(ns, name string, d time.Duration) {
	for {
		if sim.isPodCreated(ns, name) {
			break
		}
		time.Sleep(d)
	}
}

func (sim *Simulator) syncPodDelete(ns, name string, d time.Duration) {
	for {
		log.Debugf("check if pod(%s) has been deleted\n", name)
		if sim.isPodDeleted(ns, name) {
			break
		}
		time.Sleep(d)
	}
	time.Sleep(d)
}

func (sim *Simulator) syncNodeUpdateOnPodCreate(nodeName string, p *corev1.Pod, d time.Duration) {
	for {
		node, _ := sim.client.CoreV1().Nodes().Get(sim.ctx, nodeName, metav1.GetOptions{})
		if node == nil {
			log.Errorf("syncNodeUpdateOnPodCreate] failed to get node(%s) when creating pod(%s)\n",
				nodeName, utils.GeneratePodKey(p))
			break
		}

		// only check gpu pod because creating it will update node gpu annotation
		if gpushareutils.GetGpuMilliFromPodAnnotation(p) > 0 {
			if sim.isPodFoundInNodeGpuAnno(node, p) {
				break
			}
		} else {
			break
		}

		time.Sleep(d)
	}
}

func (sim *Simulator) syncNodeUpdateOnPodDelete(nodeName string, p *corev1.Pod, d time.Duration) {
	for {
		node, _ := sim.client.CoreV1().Nodes().Get(sim.ctx, nodeName, metav1.GetOptions{})
		if node == nil {
			log.Errorf("[syncNodeUpdateOnPodDelete] failed to get node(%s)\n", nodeName)
			break
		}

		// only check gpu pod because deleting it will update node gpu annotation
		if gpushareutils.GetGpuMilliFromPodAnnotation(p) > 0 {
			if !sim.isPodFoundInNodeGpuAnno(node, p) {
				break
			}
		} else {
			break
		}

		time.Sleep(d)
	}
}

func (sim *Simulator) syncNodeCreate(name string, d time.Duration) {
	for {
		if sim.isNodeCreated(name) {
			break
		}
		time.Sleep(d)
	}
	log.Debugf("node(%s) has been successfully created\n", name)
	time.Sleep(d) // sleep for a while to avoid event channel full
}

// syncClusterResourceList: 1) load Pods into creation and deletion events. 2) schedule and delete these existing Pods.
func (sim *Simulator) syncClusterResourceList(resourceList ResourceTypes) ([]simontype.UnscheduledPod, error) {
	//sync node
	sort.Slice(resourceList.Nodes, func(i, j int) bool {
		return resourceList.Nodes[i].Name < resourceList.Nodes[j].Name
	})
	randomIndex := rand.Perm(len(resourceList.Nodes))
	for i := 0; i < len(randomIndex); i++ {
		idx := randomIndex[i]
		resourceList.Nodes[i].Name = fmt.Sprintf("%04d-", idx) + resourceList.Nodes[i].Name
	}
	for i, item := range resourceList.Nodes {
		log.Debugf("[%d] attempt to create node(%s)\n", i, item.Name)
		if _, err := sim.client.CoreV1().Nodes().Create(sim.ctx, item, metav1.CreateOptions{}); err != nil {
			return nil, fmt.Errorf("unable to copy node: %v", err)
		}
		sim.syncNodeCreate(item.Name, 1*time.Millisecond)
	}

	//sync pdb
	for _, item := range resourceList.PodDisruptionBudgets {
		if _, err := sim.client.PolicyV1beta1().PodDisruptionBudgets(item.Namespace).Create(context.TODO(), item, metav1.CreateOptions{}); err != nil {
			return nil, fmt.Errorf("unable to copy PDB: %v", err)
		}
	}

	//sync svc
	for _, item := range resourceList.Services {
		if _, err := sim.client.CoreV1().Services(item.Namespace).Create(context.TODO(), item, metav1.CreateOptions{}); err != nil {
			return nil, fmt.Errorf("unable to copy service: %v", err)
		}
	}

	//sync storage class
	for _, item := range resourceList.StorageClasss {
		if _, err := sim.client.StorageV1().StorageClasses().Create(context.TODO(), item, metav1.CreateOptions{}); err != nil {
			return nil, fmt.Errorf("unable to copy storage class: %v", err)
		}
	}

	//sync pvc
	for _, item := range resourceList.PersistentVolumeClaims {
		if _, err := sim.client.CoreV1().PersistentVolumeClaims(item.Namespace).Create(context.TODO(), item, metav1.CreateOptions{}); err != nil {
			return nil, fmt.Errorf("unable to copy pvc: %v", err)
		}
	}

	//sync rc
	for _, item := range resourceList.ReplicationControllers {
		if _, err := sim.client.CoreV1().ReplicationControllers(item.Namespace).Create(context.TODO(), item, metav1.CreateOptions{}); err != nil {
			return nil, fmt.Errorf("unable to copy RC: %v", err)
		}
	}

	//sync deployment
	for _, item := range resourceList.Deployments {
		if _, err := sim.client.AppsV1().Deployments(item.Namespace).Create(context.TODO(), item, metav1.CreateOptions{}); err != nil {
			return nil, fmt.Errorf("unable to copy deployment: %v", err)
		}
	}

	//sync rs
	for _, item := range resourceList.ReplicaSets {
		if _, err := sim.client.AppsV1().ReplicaSets(item.Namespace).Create(context.TODO(), item, metav1.CreateOptions{}); err != nil {
			return nil, fmt.Errorf("unable to copy replica set: %v", err)
		}
	}

	//sync statefulset
	for _, item := range resourceList.StatefulSets {
		if _, err := sim.client.AppsV1().StatefulSets(item.Namespace).Create(context.TODO(), item, metav1.CreateOptions{}); err != nil {
			return nil, fmt.Errorf("unable to copy stateful set: %v", err)
		}
	}

	//sync daemonset
	for _, item := range resourceList.DaemonSets {
		if _, err := sim.client.AppsV1().DaemonSets(item.Namespace).Create(context.TODO(), item, metav1.CreateOptions{}); err != nil {
			return nil, fmt.Errorf("unable to copy daemon set: %v", err)
		}
	}

	// sync pods
	var podEvents []*corev1.Pod
	for _, p := range resourceList.Pods {
		// pod creation event
		podCreate := p.DeepCopy()
		delete(podCreate.Annotations, gpushareutils.DeletionTime)
		podEvents = append(podEvents, podCreate)

		// pod deletion event
		deletionTime := gpushareutils.GetDeletionTimeFromPodAnnotation(p)
		if deletionTime != nil {
			podDelete := p.DeepCopy()
			delete(podDelete.Annotations, gpushareutils.CreationTime)
			podEvents = append(podEvents, podDelete)
		}
	}
	// sort pod creation/deletion events according to timestamp
	sort.SliceStable(podEvents, func(i, j int) bool {
		// c: creation, d: deletion
		ci, di := gpushareutils.GetCreationTimeFromPodAnnotation(podEvents[i]), gpushareutils.GetDeletionTimeFromPodAnnotation(podEvents[i])
		cj, dj := gpushareutils.GetCreationTimeFromPodAnnotation(podEvents[j]), gpushareutils.GetDeletionTimeFromPodAnnotation(podEvents[j])

		var ti time.Time
		if ci != nil {
			ti = *ci
		} else if di != nil {
			ti = *di
		}

		var tj time.Time
		if cj != nil {
			tj = *cj
		} else if dj != nil {
			tj = *dj
		}

		// undefined goes before all, see simulator.TestSortPodsByTimestamp
		return ti.Before(tj)
	})
	failedPods := sim.SchedulePods(podEvents)

	return failedPods, nil
}

// WithKubeConfig sets kubeconfig for Simulator, the default value is ""
func WithKubeConfig(kubeconfig string) Option {
	return func(o *simulatorOptions) {
		o.kubeconfig = kubeconfig
	}
}

// WithSchedulerConfig sets schedulerConfig for Simulator, the default value is ""
func WithSchedulerConfig(schedulerConfig string) Option {
	return func(o *simulatorOptions) {
		o.schedulerConfig = schedulerConfig
	}
}

func WithCustomConfig(customConfig v1alpha1.CustomConfig) Option {
	return func(o *simulatorOptions) {
		o.customConfig = customConfig
	}
}

// CreateClusterResourceFromClient returns a ResourceTypes struct by kube-client that connects a real cluster
func CreateClusterResourceFromClient(client externalclientset.Interface) (ResourceTypes, error) {
	var resource ResourceTypes
	var err error
	nodeItems, err := client.CoreV1().Nodes().List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list nodes: %v", err)
	}
	for _, item := range nodeItems.Items {
		newItem := item
		resource.Nodes = append(resource.Nodes, &newItem)
	}

	// TODO:
	// For all pods in the real cluster, we only retain static pods.
	// We will regenerate pods of all workloads in the follow-up stage.
	podItems, err := client.CoreV1().Pods(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list pods: %v", err)
	}
	for _, item := range podItems.Items {
		if kubetypes.IsStaticPod(&item) {
			newItem := item
			resource.Pods = append(resource.Pods, &newItem)
		}
	}

	pdbItems, err := client.PolicyV1beta1().PodDisruptionBudgets(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list PDBs: %v", err)
	}
	for _, item := range pdbItems.Items {
		newItem := item
		resource.PodDisruptionBudgets = append(resource.PodDisruptionBudgets, &newItem)
	}

	serviceItems, err := client.CoreV1().Services(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list services: %v", err)
	}
	for _, item := range serviceItems.Items {
		newItem := item
		resource.Services = append(resource.Services, &newItem)
	}

	storageClassesItems, err := client.StorageV1().StorageClasses().List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list storage classes: %v", err)
	}
	for _, item := range storageClassesItems.Items {
		newItem := item
		resource.StorageClasss = append(resource.StorageClasss, &newItem)
	}

	pvcItems, err := client.CoreV1().PersistentVolumeClaims(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list pvcs: %v", err)
	}
	for _, item := range pvcItems.Items {
		newItem := item
		resource.PersistentVolumeClaims = append(resource.PersistentVolumeClaims, &newItem)
	}

	rcItems, err := client.CoreV1().ReplicationControllers(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list RCs: %v", err)
	}
	for _, item := range rcItems.Items {
		newItem := item
		resource.ReplicationControllers = append(resource.ReplicationControllers, &newItem)
	}

	deploymentItems, err := client.AppsV1().Deployments(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list deployment: %v", err)
	}
	for _, item := range deploymentItems.Items {
		newItem := item
		resource.Deployments = append(resource.Deployments, &newItem)
	}

	replicaSetItems, err := client.AppsV1().ReplicaSets(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list replicas sets: %v", err)
	}
	for _, item := range replicaSetItems.Items {
		if !ownedByDeployment(item.OwnerReferences) {
			newItem := item
			resource.ReplicaSets = append(resource.ReplicaSets, &newItem)
		}
	}

	statefulSetItems, err := client.AppsV1().StatefulSets(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list stateful sets: %v", err)
	}
	for _, item := range statefulSetItems.Items {
		newItem := item
		resource.StatefulSets = append(resource.StatefulSets, &newItem)
	}

	daemonSetItems, err := client.AppsV1().DaemonSets(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list daemon sets: %v", err)
	}
	for _, item := range daemonSetItems.Items {
		newItem := item
		resource.DaemonSets = append(resource.DaemonSets, &newItem)
	}

	cronJobItems, err := client.BatchV1beta1().CronJobs(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list cronjob: %v", err)
	}
	for _, item := range cronJobItems.Items {
		newItem := item
		resource.CronJobs = append(resource.CronJobs, &newItem)
	}

	jobItems, err := client.BatchV1().Jobs(metav1.NamespaceAll).List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		return resource, fmt.Errorf("unable to list job: %v", err)
	}
	for _, item := range jobItems.Items {
		if !ownedByCronJob(item.OwnerReferences) {
			newItem := item
			resource.Jobs = append(resource.Jobs, &newItem)
		}
	}

	return resource, nil
}

// CreateClusterResourceFromClusterConfig return a ResourceTypes struct based on the cluster config
func CreateClusterResourceFromClusterConfig(path string) (ResourceTypes, error) {
	var resource ResourceTypes
	var content []string
	var err error

	if content, err = utils.GetYamlContentFromDirectory(path); err != nil {
		return ResourceTypes{}, fmt.Errorf("failed to get the yaml content from the cluster directory(%s): %v", path, err)
	}
	if resource, err = GetObjectFromYamlContent(content); err != nil {
		return resource, err
	}

	MatchAndSetLocalStorageAnnotationOnNode(resource.Nodes, path)

	return resource, nil
}

func ownedByDeployment(refs []metav1.OwnerReference) bool {
	for _, ref := range refs {
		if ref.Kind == simontype.Deployment {
			return true
		}
	}
	return false
}

func ownedByCronJob(refs []metav1.OwnerReference) bool {
	for _, ref := range refs {
		if ref.Kind == simontype.CronJob {
			return true
		}
	}
	return false
}

func getPodfromPodMap(podKeys []string, podMap map[string]*corev1.Pod) []*corev1.Pod {
	var podList []*corev1.Pod
	for _, podKey := range podKeys {
		podCopy := MakePodUnassigned(podMap[podKey])
		podList = append(podList, podCopy)
	}
	return podList
}

func (sim *Simulator) getNodeFragAmountList(nodeStatus []simontype.NodeStatus) []utils.FragAmount {
	nodeResourceMap := utils.GetNodeResourceMap(nodeStatus)
	nodeFragAmountMap := sim.NodeGpuFragAmountMap(nodeResourceMap)

	var nodeFragAmountList []utils.FragAmount
	for _, v := range nodeFragAmountMap {
		nodeFragAmountList = append(nodeFragAmountList, v)
	}
	sort.Slice(nodeFragAmountList, func(i int, j int) bool {
		return nodeFragAmountList[i].FragAmountSumExceptQ3() > nodeFragAmountList[j].FragAmountSumExceptQ3()
	})
	return nodeFragAmountList
}

func (sim *Simulator) getCurrentPodMap() map[string]*corev1.Pod {
	podMap := make(map[string]*corev1.Pod)
	podList, _ := sim.client.CoreV1().Pods(metav1.NamespaceAll).List(sim.ctx, metav1.ListOptions{})
	for _, pod := range podList.Items {
		podMap[utils.GeneratePodKey(&pod)] = pod.DeepCopy()
	}
	return podMap
}

func (sim *Simulator) SetWorkloadPods(pods []*corev1.Pod) {
	sim.workloadPods = []*corev1.Pod{}
	for _, p := range pods {
		pod := MakePodUnassigned(p.DeepCopy())
		if pod.Spec.NodeSelector != nil {
			delete(pod.Spec.NodeSelector, simontype.HostName)
			delete(pod.Spec.NodeSelector, simontype.NodeIp)
		}
		if pod.Annotations != nil {
			delete(pod.Annotations, gpushareutils.CreationTime)
			delete(pod.Annotations, gpushareutils.DeletionTime)
		}
		ClearPodUnscheduledAnno(pod)
		sim.workloadPods = append(sim.workloadPods, pod)
	}
	// keep the order...
	sort.Slice(sim.workloadPods, func(i, j int) bool {
		return sim.workloadPods[i].Name < sim.workloadPods[j].Name
	})
}

func (sim *Simulator) SortClusterPods(pods []*corev1.Pod) {
	var err error
	shufflePod := sim.customConfig.ShufflePod
	if shufflePod {
		sort.Slice(pods, func(i, j int) bool {
			return pods[i].Name < pods[j].Name
		})
		rand.Shuffle(len(pods), func(i, j int) {
			pods[i], pods[j] = pods[j], pods[i]
		})
	} else {
		timeNow := time.Now() //.Format(time.RFC3339)
		sort.SliceStable(pods, func(i, j int) bool {
			var timeI, timeJ time.Time
			if timeStr, ok := pods[i].Annotations[gpushareutils.CreationTime]; ok {
				timeI, err = time.Parse(time.RFC3339, timeStr)
				if err != nil {
					log.Errorf("Time Parse %s err: %s\n", timeStr, err.Error())
					timeI = timeNow
				}
			} else {
				timeI = timeNow
			}

			if timeStr, ok := pods[j].Annotations[gpushareutils.CreationTime]; ok {
				timeJ, err = time.Parse(time.RFC3339, timeStr)
				if err != nil {
					log.Errorf("Time Parse %s err: %s\n", timeStr, err.Error())
					timeJ = timeNow
				}
			} else {
				timeJ = timeNow
			}
			return timeI.Before(timeJ) || (timeI.Equal(timeJ) && pods[i].Name < pods[j].Name)
		})
	}
}

func (sim *Simulator) RunWorkloadInflationEvaluation(tag string) {
	// 1. Generate a batch of inflation pods
	inflationPods := sim.generateWorkloadInflationPods()
	if len(inflationPods) == 0 {
		return
	}

	// 2. Schedule them
	failedPods := sim.SchedulePods(inflationPods)
	utils.ReportFailedPods(failedPods)

	// 3. Analyze the current state of the cluster
	sim.ClusterAnalysis(tag)

	// 4. Clean up all the inflation pods from the cluster
	for _, pod := range inflationPods {
		err := sim.deletePod(pod)
		if err != nil {
			log.Errorf("[RunWorkloadInflationEvaluation] failed to delete inflation pod(%s)\n",
				utils.GeneratePodKey(pod))
		}
	}
}

func (sim *Simulator) generateWorkloadInflationPods() []*corev1.Pod {
	n := len(sim.workloadPods)
	if n == 0 {
		log.Infof("[generateWorkloadInflationPods] original workload is empty\n")
		return nil
	}
	podResCntMap := map[simontype.PodResource]float64{}
	podGpuCntMap := map[string]int64{}
	for _, v := range utils.GpuNumTypeList {
		podGpuCntMap[v] = 0
	}

	ratio := sim.customConfig.WorkloadInflationConfig.Ratio
	if ratio > 1 {
		var inflationPods []*corev1.Pod
		inflationNum := int(math.Ceil(float64(n)*ratio)) - n
		podTotalMilliCpuReq, podTotalMilliGpuReq := sim.podTotalMilliCpuReq, sim.podTotalMilliGpuReq
		for i := 0; i < inflationNum; i++ {
			idx := rand.Intn(n)
			podCloned, err := utils.MakeValidPodByPod(sim.workloadPods[idx].DeepCopy())
			if err != nil {
				log.Errorf("[generateWorkloadInflationPods] failed to clone pod(%s)\n",
					utils.GeneratePodKey(sim.workloadPods[idx]))
				continue
			}
			podCloned.Name = fmt.Sprintf("%s-clone-%d", podCloned.Name, i)
			podRes := utils.GetPodResource(podCloned)
			// avoid total resource requests of pods exceeding the capacity after adding inflation pods
			if podRes.MilliCpu+podTotalMilliCpuReq <= sim.nodeTotalMilliCpu &&
				podRes.MilliGpu*int64(podRes.GpuNumber)+podTotalMilliGpuReq <= sim.nodeTotalMilliGpu {

				podTotalMilliCpuReq += podRes.MilliCpu
				podTotalMilliGpuReq += podRes.TotalMilliGpu()
			} else {
				log.Infof("Stop early during workload inflation, "+
					"because the total resource requests for pods(milli cpu %d, milli gpu %d) have exceeded "+
					"the total resources of nodes(milli cpu %d, milli gpu %d).\n",
					podRes.MilliCpu+podTotalMilliCpuReq, podRes.MilliGpu*int64(podRes.GpuNumber)+podTotalMilliGpuReq,
					sim.nodeTotalMilliCpu, sim.nodeTotalMilliGpu)
				break
			}
			inflationPods = append(inflationPods, podCloned)

			// Accounting
			if cnt, ok := podResCntMap[podRes]; ok {
				podResCntMap[podRes] = cnt + 1
			} else {
				podResCntMap[podRes] = 1
			}
			switch podRes.GpuNumber {
			case 0:
				podGpuCntMap[utils.GpuNumTypeList[0]] += 1 // CPU
			case 1:
				if podRes.MilliGpu < gpushareutils.MILLI {
					podGpuCntMap[utils.GpuNumTypeList[1]] += 1 // ShareGpu
				} else {
					podGpuCntMap[utils.GpuNumTypeList[2]] += 1 // OneGpu
				}
			case 2:
				podGpuCntMap[utils.GpuNumTypeList[3]] += 1 // TwoGpu
			case 4:
				podGpuCntMap[utils.GpuNumTypeList[4]] += 1 // FourGpu
			case 8:
				podGpuCntMap[utils.GpuNumTypeList[5]] += 1 // EightGpu
			default:
				podGpuCntMap[utils.GpuNumTypeList[6]] += 1 // Others
			}
		}
		tgtPodList := utils.SortTargetPodInDecreasingCount(podResCntMap)
		log.Infof("(Inflation) Num of Total Pods: %d\n", len(inflationPods))
		for _, k := range utils.GpuNumTypeList { // iter List, instead of Map, to guarantee order
			ratioPct := 100.0 * float64(podGpuCntMap[k]) / float64(len(inflationPods))
			log.Infof("(Inflation)   %s Pods: %d (%.2f%%)\n", k, podGpuCntMap[k], ratioPct)
		}
		log.Infof("(Inflation) Num of Total Pod Sepc: %d\n", len(tgtPodList))
		var cumRatioPct float64
		for i := 0; i < len(tgtPodList); i++ {
			podNumber := tgtPodList[i].Percentage
			tgtPodList[i].Percentage = podNumber / float64(len(inflationPods)) // normalized to 0.0-1.0
			ratioPct := 100.0 * tgtPodList[i].Percentage
			cumRatioPct += ratioPct
			log.Infof("[%d] %s: %.0f (%.2f%%, cumsum: %.2f%%)\n", i, tgtPodList[i].TargetPodResource.Repr(), podNumber, ratioPct, cumRatioPct)
		}

		log.Infof("workload inflation ratio: %.4f, "+
			"the expected number of inflation pods: %d, "+
			"The actual number of inflation pods: %d, "+
			"total resource requests for pods(milli cpu %d, milli gpu %d), "+
			"total resources of nodes(milli cpu %d, milli gpu %d)\n",
			ratio, inflationNum, len(inflationPods), podTotalMilliCpuReq, podTotalMilliGpuReq, sim.nodeTotalMilliCpu, sim.nodeTotalMilliGpu)
		return inflationPods
	}
	return nil
}

func displaySchedulerConfig(config *config.CompletedConfig) {
	profiles := config.ComponentConfig.Profiles
	if profiles == nil || len(profiles) < 1 {
		return
	}
	for _, profile := range profiles {
		log.Infof("Scheduler Config: %s\n", profile.SchedulerName)
		// PreFilter
		if profile.Plugins.PreFilter != nil {
			log.Infof("  PreFilter Plugin")
			for _, plugin := range profile.Plugins.PreFilter.Enabled {
				log.Infof("    %s\n", plugin.Name)
			}
			log.Infoln()
		}
		// Filter
		if profile.Plugins.Filter != nil {
			log.Infof("  Filter Plugin")
			for _, plugin := range profile.Plugins.Filter.Enabled {
				log.Infof("    %s\n", plugin.Name)
			}
			log.Infoln()
		}
		// PreScore
		if profile.Plugins.PreScore != nil {
			log.Infof("  PreScore Plugin")
			for _, plugin := range profile.Plugins.PreScore.Enabled {
				log.Infof("    %s\n", plugin.Name)
			}
			log.Infoln()
		}
		// Score
		if profile.Plugins.Score != nil {
			log.Infof("  Score Plugin")
			for _, plugin := range profile.Plugins.Score.Enabled {
				log.Infof("    %s: %d\n", plugin.Name, plugin.Weight)
			}
			log.Infoln()
		}
		// Reserve
		if profile.Plugins.Reserve != nil {
			log.Infof("  Reserve Plugin")
			for _, plugin := range profile.Plugins.Reserve.Enabled {
				log.Infof("    %s\n", plugin.Name)
			}
			log.Infoln()
		}
		// Bind
		if profile.Plugins.Bind != nil {
			log.Infof("  Bind Plugin")
			for _, plugin := range profile.Plugins.Bind.Enabled {
				log.Infof("    %s\n", plugin.Name)
			}
			log.Infoln()
		}
		// Plugin Config
		log.Infof("  pluginConfig")
		for _, pc := range profile.PluginConfig {
			log.Infof("    %s\n", pc.Name)
			args, _ := json.Marshal(pc.Args)
			log.Infof("      %s", args)
		}
		log.Infoln()
	}
}

// TunePodsByNodeTotalResource prune or append pods to match the cfg.Ratio * (cluster_GPU_capacity)
func (sim *Simulator) TunePodsByNodeTotalResource(pods []*corev1.Pod, cfg v1alpha1.WorkloadTuningConfig) []*corev1.Pod {
	if sim.podTotalMilliCpuReq <= 0 {
		panic("sim.podTotalMilliCpuReq <= 0")
	} else if sim.podTotalMilliGpuReq <= 0 {
		panic("sim.podTotalMilliGpuReq <= 0")
	} else if sim.nodeTotalMilliCpu <= 0 {
		panic("sim.nodeTotalMilliCpuReq <= 0")
	} else if sim.nodeTotalMilliGpu <= 0 {
		panic("sim.nodeTotalMilliGpuReq <= 0")
	}

	tuneRatio := cfg.Ratio
	tgtTotalMilliGpu := tuneRatio * float64(sim.nodeTotalMilliGpu)
	log.Infof("[Tune] Num of Pods before Tuning: %d\n", len(pods))
	log.Infof("[Tune] %d vs %.2f (%.2f * %d)\n", sim.podTotalMilliGpuReq, tgtTotalMilliGpu, tuneRatio, sim.nodeTotalMilliGpu)
	if tuneRatio <= 0 {
		log.Infof("[Tune] Num of Pods after Tuning: %d\n", len(pods))
		return pods
	} else if float64(sim.podTotalMilliGpuReq) == tgtTotalMilliGpu {
		log.Infof("[Tune] Num of Pods after Tuning: %d\n", len(pods))
		return pods
	} else if float64(sim.podTotalMilliGpuReq) > tgtTotalMilliGpu {
		pods = sim.tuneDownPods(pods, cfg)
		log.Infof("[Tune] Num of Pods after Tuning: %d\n", len(pods))
		return pods
	} else if float64(sim.podTotalMilliGpuReq) < tgtTotalMilliGpu {
		pods = sim.tuneUpPods(pods, cfg)
		log.Infof("[Tune] Num of Pods after Tuning: %d\n", len(pods))
		return pods
	} else {
		panic(fmt.Sprintf("%d ?= %.2f (%.2f * %d)", sim.podTotalMilliGpuReq, tgtTotalMilliGpu, tuneRatio, sim.nodeTotalMilliGpu))
	}
}

func RemovePodsByIndex(s []*corev1.Pod, index int) []*corev1.Pod {
	return append(s[:index], s[index+1:]...)
}

func (sim *Simulator) tuneDownPods(pods []*corev1.Pod, cfg v1alpha1.WorkloadTuningConfig) []*corev1.Pod {
	tuneRatio := cfg.Ratio
	for float64(sim.podTotalMilliGpuReq) > tuneRatio*float64(sim.nodeTotalMilliGpu) {
		if numPods := len(pods); numPods > 0 {
			idx := rand.Intn(numPods)
			podToRm := pods[idx]
			podRes := utils.GetPodResource(podToRm)
			pods = RemovePodsByIndex(pods, idx)
			sim.podTotalMilliGpuReq -= podRes.TotalMilliGpu()
		} else {
			panic(fmt.Sprintf("Empty pods list while podTotalMilliGpuReq(%d) > tuneRatio(%.2f) * nodeTotalMilliGpu(%d)", sim.podTotalMilliGpuReq, tuneRatio, sim.nodeTotalMilliGpu))
		}
	}
	return pods
}

func (sim *Simulator) tuneUpPods(pods []*corev1.Pod, cfg v1alpha1.WorkloadTuningConfig) []*corev1.Pod {
	tuneRatio := cfg.Ratio
	n := len(sim.workloadPods)
	i := 0
	for { // do-while style
		idx := rand.Intn(n)
		podTuned, _ := utils.MakeValidPodByPod(sim.workloadPods[idx].DeepCopy())
		podTuned.Name = fmt.Sprintf("%s-tuned-%d", podTuned.Name, i)
		podRes := utils.GetPodResource(podTuned)
		if float64(sim.podTotalMilliGpuReq+podRes.MilliGpu) > tuneRatio*float64(sim.nodeTotalMilliGpu) {
			break
		} else {
			sim.podTotalMilliGpuReq += podRes.TotalMilliGpu()
			pods = append(pods, podTuned)
			i += 1
		}
	}
	return pods
}
