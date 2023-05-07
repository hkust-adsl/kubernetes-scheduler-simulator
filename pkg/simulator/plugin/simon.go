package plugin

import (
	"context"
	"fmt"
	"math"

	log "github.com/sirupsen/logrus"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	externalclientset "k8s.io/client-go/kubernetes"
	fakeclientset "k8s.io/client-go/kubernetes/fake"
	resourcehelper "k8s.io/kubectl/pkg/util/resource"
	framework "k8s.io/kubernetes/pkg/scheduler/framework"

	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/algo"
	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
)

// SimonPlugin is a plugin for scheduling framework
type SimonPlugin struct {
	handle framework.Handle
}

var _ = framework.ScorePlugin(&SimonPlugin{})
var _ = framework.BindPlugin(&SimonPlugin{})

func NewSimonPlugin(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	return &SimonPlugin{
		handle: handle,
	}, nil
}

// Name returns name of the plugin. It is used in logs, etc.
func (plugin *SimonPlugin) Name() string {
	return simontype.SimonPluginName
}

// Bind invoked at the bind extension point.
func (plugin *SimonPlugin) Bind(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, nodeName string) *framework.Status {
	return plugin.BindPodToNode(ctx, state, pod, nodeName)
}

// Score invoked at the score extension point.
func (plugin *SimonPlugin) Score(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, nodeName string) (int64, *framework.Status) {
	podReq, _ := resourcehelper.PodRequestsAndLimits(pod)
	if len(podReq) == 0 {
		return framework.MaxNodeScore, framework.NewStatus(framework.Success)
	}

	node, err := plugin.handle.ClientSet().CoreV1().Nodes().Get(context.Background(), nodeName, metav1.GetOptions{})
	if err != nil {
		return int64(framework.MinNodeScore),
			framework.NewStatus(framework.Error, fmt.Sprintf("failed to get node %s: %s\n", nodeName, err.Error()))
	}

	res := float64(0)
	for resourceName := range node.Status.Allocatable {
		podAllocatedRes := podReq[resourceName]
		nodeAvailableRes := node.Status.Allocatable[resourceName]
		nodeAvailableRes.Sub(podAllocatedRes)
		share := algo.Share(podAllocatedRes.AsApproximateFloat64(), nodeAvailableRes.AsApproximateFloat64())
		if share > res {
			res = share
		}
	}

	return int64(math.Round(float64(framework.MaxNodeScore-framework.MinNodeScore) * res)), framework.NewStatus(framework.Success)
}

// ScoreExtensions of the Score plugin.
func (plugin *SimonPlugin) ScoreExtensions() framework.ScoreExtensions {
	return plugin
}

// NormalizeScore invoked after scoring all nodes.
func (plugin *SimonPlugin) NormalizeScore(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, scores framework.NodeScoreList) *framework.Status {
	return NormalizeScore(scores)
}

// BindPodToNode bind pod to a node and trigger pod update event
func (plugin *SimonPlugin) BindPodToNode(ctx context.Context, state *framework.CycleState, p *corev1.Pod, nodeName string) *framework.Status {
	log.Debugf("bind pod(%s) to node(%s)\n", utils.GeneratePodKey(p), nodeName)
	switch t := plugin.handle.ClientSet().(type) {
	case *externalclientset.Clientset:
		// production env
		binding := &corev1.Binding{
			ObjectMeta: metav1.ObjectMeta{Namespace: p.Namespace, Name: p.Name, UID: p.UID},
			Target:     corev1.ObjectReference{Kind: "Node", Name: nodeName},
		}
		err := plugin.handle.ClientSet().CoreV1().Pods(binding.Namespace).Bind(ctx, binding, metav1.CreateOptions{})
		if err != nil {
			log.Errorf("fake update error %v", err)
			return framework.NewStatus(framework.Error, fmt.Sprintf("Unable to add new pod: %v", err))
		}
	case *fakeclientset.Clientset:
		// fake env
		pod, err := plugin.handle.ClientSet().CoreV1().Pods(p.Namespace).Get(ctx, p.Name, metav1.GetOptions{})
		if err != nil {
			return framework.NewStatus(framework.Error,
				fmt.Sprintf("Failed to get pod(%s): %v", utils.GeneratePodKey(p), err))
		}

		updatePod := pod.DeepCopy()
		updatePod.Spec.NodeName = nodeName
		updatePod.Status.Phase = corev1.PodRunning

		_, err = plugin.handle.ClientSet().CoreV1().Pods(p.Namespace).Update(ctx, updatePod, metav1.UpdateOptions{})
		if err != nil {
			return framework.NewStatus(framework.Error,
				fmt.Sprintf("Failed to update pod(%s): %v", utils.GeneratePodKey(p), err))
		}
	default:
		return framework.NewStatus(framework.Error, fmt.Sprintf("Unknown client type: %T", t))
	}

	return nil
}
