package cache

import (
	"sync"

	log "github.com/sirupsen/logrus"
	"k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/types"

	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
)

type SchedulerCache struct {
	nodes     map[string]*GpuNodeInfo // key: node name.
	getter    NodePodGetter           // nodeLister and podLister
	knownPods map[types.UID]*v1.Pod   // pods are added when certain annotation is added and removed when complete and deleted
	nLock     *sync.RWMutex
}

type NodePodGetter interface {
	NodeGet(name string) (*v1.Node, error)
	PodGet(name string, namespace string) (*v1.Pod, error)
}

func NewSchedulerCache(getter NodePodGetter) *SchedulerCache {
	return &SchedulerCache{
		nodes:     make(map[string]*GpuNodeInfo),
		getter:    getter,
		knownPods: make(map[types.UID]*v1.Pod),
		nLock:     new(sync.RWMutex),
	}
}

func (cache *SchedulerCache) GetGpuNodeinfos() []*GpuNodeInfo {
	nodes := []*GpuNodeInfo{}
	for _, n := range cache.nodes {
		nodes = append(nodes, n)
	}
	return nodes
}

// BuildCache build cache when initializing
//func (cache *SchedulerCache) BuildCache() error {
//	if podList, _ := cache.podLister.List(labels.Everything()); err != nil {
//		return nil
//	} else {
//		return cache.BuildCacheFromPodList(podList)
//	}
//}

func (cache *SchedulerCache) BuildCacheFromPodList(podList []*v1.Pod) error {
	//log.Println("debug: begin to build scheduler cache")
	for _, pod := range podList {
		if utils.GetGpuMilliFromPodAnnotation(pod) <= int64(0) {
			continue
		}

		if len(pod.Spec.NodeName) == 0 {
			continue
		}

		if err := cache.AddOrUpdatePod(pod, pod.Spec.NodeName); err != nil {
			return err
		}
	}
	return nil
}

func (cache *SchedulerCache) GetPod(name, namespace string) (*v1.Pod, error) {
	return cache.getter.PodGet(name, namespace)
}

// KnownPod Get known pod from the pod UID
func (cache *SchedulerCache) KnownPod(podUID types.UID) bool {
	cache.nLock.RLock()
	defer cache.nLock.RUnlock()

	_, found := cache.knownPods[podUID]
	return found
}

func (cache *SchedulerCache) AddOrUpdatePod(pod *v1.Pod, nodeName string) error {
	n, err := cache.GetGpuNodeInfo(nodeName)
	if err != nil {
		return err
	}
	podCopy := pod.DeepCopy()
	if n.addOrUpdatePod(podCopy) {
		// put it into known pod
		cache.rememberPod(podCopy)
	} else {
		log.Errorf("[AddOrUpdatePod] failed to addOrUpdate pod(%s) on node(%s)\n",
			utils.GeneratePodKey(pod), nodeName)
	}

	return nil
}

// The lock is in cacheNode
func (cache *SchedulerCache) RemovePod(pod *v1.Pod, nodeName string) {
	n, err := cache.GetGpuNodeInfo(nodeName)
	if err == nil {
		n.removePod(pod)
	} else {
		log.Errorf("[RemovePod] failed to remove pod(%s) from node(%s)\n",
			utils.GeneratePodKey(pod), nodeName)
	}

	cache.forgetPod(pod.UID)
}

// Get or build nodeInfo if it doesn't exist
func (cache *SchedulerCache) GetGpuNodeInfo(name string) (*GpuNodeInfo, error) {
	node, err := cache.getter.NodeGet(name)
	if err != nil {
		return nil, err
	}

	cache.nLock.Lock()
	defer cache.nLock.Unlock()
	n, ok := cache.nodes[name]

	if !ok {
		n = NewGpuNodeInfo(node)
		cache.nodes[name] = n
	}
	return n, nil
}

func (cache *SchedulerCache) forgetPod(uid types.UID) {
	cache.nLock.Lock()
	defer cache.nLock.Unlock()
	delete(cache.knownPods, uid)
}

func (cache *SchedulerCache) rememberPod(pod *v1.Pod) {
	cache.nLock.Lock()
	defer cache.nLock.Unlock()
	cache.knownPods[pod.UID] = pod
}

func (cache *SchedulerCache) ExportGpuNodeInfoAsStr(nodeName string) (*GpuNodeInfoStr, error) {
	if gpuNodeInfo, err := cache.GetGpuNodeInfo(nodeName); err != nil {
		return gpuNodeInfo.ExportGpuNodeInfoAsStr(), nil
	} else {
		return nil, err
	}
}
