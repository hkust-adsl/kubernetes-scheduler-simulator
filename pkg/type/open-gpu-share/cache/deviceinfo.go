package cache

import (
	"log"
	"sync"

	"k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/types"

	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
)

type DeviceInfo struct {
	idx    int
	podMap map[types.UID]*v1.Pod
	model  string
	rwmu   *sync.RWMutex
}

func (d *DeviceInfo) GetPods() []*v1.Pod {
	pods := []*v1.Pod{}
	for _, pod := range d.podMap {
		pods = append(pods, pod)
	}
	return pods
}

func newDeviceInfo(index int, cardModel string) *DeviceInfo {
	return &DeviceInfo{
		idx:    index,
		podMap: map[types.UID]*v1.Pod{},
		model:  cardModel,
		rwmu:   new(sync.RWMutex),
	}
}

func (d *DeviceInfo) GetUsedGpuMilli() (gpuMilli int64) {
	d.rwmu.RLock()
	defer d.rwmu.RUnlock()
	for _, pod := range d.podMap {
		if pod.Status.Phase == v1.PodSucceeded || pod.Status.Phase == v1.PodFailed {
			log.Printf("debug: skip the pod %s in ns %s due to its status is %s", pod.Name, pod.Namespace, pod.Status.Phase)
			continue
		}

		gpuMilliPerGpu := utils.GetGpuMilliFromPodAnnotation(pod)
		idl, err := utils.GetGpuIdListFromAnnotation(pod)
		if err != nil {
			continue
		}
		for _, idx := range idl {
			if idx == d.idx {
				gpuMilli += gpuMilliPerGpu
			}
		}
	}
	return gpuMilli
}

func (d *DeviceInfo) addPod(pod *v1.Pod) {
	//log.Printf("debug: dev.addPod() Pod %s in ns %s with the GPU ID %d will be added to device map", pod.Name, pod.Namespace, d.Idx)
	d.rwmu.Lock()
	defer d.rwmu.Unlock()
	d.podMap[pod.UID] = pod
	//log.Printf("debug: dev.addPod() after updated is %v, and its address is %p", d.podMap, d)
}

func (d *DeviceInfo) removePod(pod *v1.Pod) {
	//log.Printf("debug: dev.removePod() Pod %s in ns %s with the GPU ID %d will be removed from device map", pod.Name, pod.Namespace, d.Idx)
	d.rwmu.Lock()
	defer d.rwmu.Unlock()
	delete(d.podMap, pod.UID)
	//log.Printf("debug: dev.removePod() after updated is %v, and its address is %p", d.podMap, d)
}

type DeviceInfoBrief struct {
	Idx          int
	Model        string
	PodList      []string
	GpuUsedMilli int64
}

func (d *DeviceInfo) ExportDeviceInfoBrief() *DeviceInfoBrief {
	var podList []string
	for _, pod := range d.podMap {
		podList = append(podList, utils.GeneratePodKey(pod))
	}
	gpuUsed := d.GetUsedGpuMilli()
	return &DeviceInfoBrief{d.idx, d.model, podList, gpuUsed}
}
