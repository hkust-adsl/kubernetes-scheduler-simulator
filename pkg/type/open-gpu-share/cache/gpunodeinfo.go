package cache

import (
	"fmt"
	"log"
	"strconv"
	"sync"

	v1 "k8s.io/api/core/v1"

	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
)

const (
	OptimisticLockErrorMsg = "the object has been modified; please apply your changes to the latest version and try again"
)

// GpuNodeInfo is node level aggregated information.
type GpuNodeInfo struct {
	name     string
	node     *v1.Node
	devs     map[int]*DeviceInfo
	gpuCount int
	model    string
	rwmu     *sync.RWMutex
}

// NewGpuNodeInfo creates Node Level
func NewGpuNodeInfo(node *v1.Node) *GpuNodeInfo {
	//log.Printf("debug: NewGpuNodeInfo() creates nodeInfo for %s", node.Name)

	cardModel := utils.GetGpuModelOfNode(node)
	devMap := map[int]*DeviceInfo{}
	for i := 0; i < utils.GetGpuCountOfNode(node); i++ {
		devMap[i] = newDeviceInfo(i, cardModel)
	}

	//if len(devMap) == 0 {
	//	log.Printf("warn: node %s with nodeinfo %v has no devices", node.Name, node)
	//}

	return &GpuNodeInfo{
		name:     node.Name,
		node:     node,
		devs:     devMap,
		gpuCount: utils.GetGpuCountOfNode(node),
		model:    cardModel,
		rwmu:     new(sync.RWMutex),
	}
}

// Reset only updates the devices when the length of devs is 0
func (n *GpuNodeInfo) Reset(node *v1.Node) {
	n.gpuCount = utils.GetGpuCountOfNode(node)
	n.node = node

	if len(n.devs) == 0 && n.gpuCount > 0 {
		cardModel := utils.GetGpuModelOfNode(node)
		devMap := map[int]*DeviceInfo{}
		for i := 0; i < utils.GetGpuCountOfNode(node); i++ {
			devMap[i] = newDeviceInfo(i, cardModel)
		}
		n.devs = devMap
	}
	//log.Printf("info: Reset() update nodeInfo for %s with devs %v", node.Name, n.devs)
}

func (n *GpuNodeInfo) GetName() string {
	return n.name
}

func (n *GpuNodeInfo) GetDevs() []*DeviceInfo {
	devs := make([]*DeviceInfo, n.gpuCount)
	for i, dev := range n.devs {
		devs[i] = dev
	}
	return devs
}

func (n *GpuNodeInfo) GetDevByDevId(devId int) (*DeviceInfo, bool) {
	dev, found := n.devs[devId]
	return dev, found
}

func (n *GpuNodeInfo) GetNode() *v1.Node {
	return n.node
}

func (n *GpuNodeInfo) GetGpuCount() int {
	return n.gpuCount
}

func (n *GpuNodeInfo) removePod(pod *v1.Pod) {
	n.rwmu.Lock()
	defer n.rwmu.Unlock()

	if idl, err := utils.GetGpuIdListFromAnnotation(pod); len(idl) > 0 && err == nil {
		for _, idx := range idl {
			if dev, found := n.devs[(idx)]; found {
				dev.removePod(pod)
			} else {
				log.Printf("[ERROR] Pod %s in ns %s failed to find the GPU ID %d in node %s", pod.Name, pod.Namespace, idx, n.name)
			}
		}
	} else {
		log.Printf("[ERROR] Pod %s in ns %s has problem with parsing GPU ID %d in node %s, error: %s. (Is Open-GPU-Share -> Bind enabled not enabled, or ", pod.Name, pod.Namespace, idl, n.name, err)
	}
}

// Add the Pod which has the GPU id to the node
func (n *GpuNodeInfo) addOrUpdatePod(pod *v1.Pod) (added bool) {
	n.rwmu.Lock()
	defer n.rwmu.Unlock()

	added = false
	if idl, err := utils.GetGpuIdListFromAnnotation(pod); err == nil {
		for _, idx := range idl {
			if dev, found := n.devs[(idx)]; found {
				dev.addPod(pod)
				added = true
			} else {
				log.Printf("warn: Pod %s in ns %s failed to find the GPU ID %d in node %s", pod.Name, pod.Namespace, idx, n.name)
			}
		}
	} else {
		log.Printf("warn: Pod %s in ns %s has problem with parsing GPU ID %d in node %s, error: %s", pod.Name, pod.Namespace, idl, n.name, err)
	}
	return added
}

// AllocateGpuId is the key of GPU allocating; it assigns the GPU ID to the pod
func (n *GpuNodeInfo) AllocateGpuId(pod *v1.Pod) (candDevId string, found bool) {
	found = false
	candDevId = ""
	// Assuming one Pod has only 1 GPU container; if not so, we let the containers share the same GPU memory spec, i.e.,
	// Resources.Limits[ResourceName] is the GPU mem spec for each GPU for all containers.
	reqGpuNum := utils.GetGpuCountFromPodAnnotation(pod)
	reqGpuMilli := utils.GetGpuMilliFromPodAnnotation(pod)
	if reqGpuMilli <= 0 || reqGpuNum <= 0 {
		return candDevId, found
	}

	idleGpus := n.getIdleGpus()
	if len(idleGpus) <= 0 {
		return candDevId, found
	}

	if id := utils.GetGpuIdFromAnnotation(pod); len(id) > 0 {
		if idl, err := utils.GpuIdStrToIntList(id); err == nil && len(idl) > 0 { // just to validate id; not return idl.
			for _, devId := range idl {
				if idleGpuMilli, ok := idleGpus[devId]; ok {
					if idleGpuMilli < reqGpuMilli {
						return "", false
					}
				} else {
					return "", false
				}
			}
			return id, true
		} else {
			log.Printf("warn: pod (%s) %s has invalid GPU ID in Annotation %s: %s", pod.Namespace, pod.Name, utils.DeviceIndex, id)
		}
	}

	if reqGpuNum == 1 { // 1-GPU pod. Adopt the original naive packing logic
		var candGpuMilli int64
		for devId := 0; devId < len(n.devs); devId++ {
			if idleGpuMilli, ok := idleGpus[devId]; ok {
				if idleGpuMilli >= reqGpuMilli {
					if candDevId == "" || idleGpuMilli < candGpuMilli {
						candDevId = strconv.Itoa(devId)
						candGpuMilli = idleGpuMilli // update to the tightest fit
						found = true
					}
				}
			}
		}
	} else { // multi-GPU pod. Greedy algorithm. Trying to pack as many containers onto 1 GPU as possible.
		var candDevIdList []int
		devId, reqGpuId := 0, 0
		for devId < len(n.devs) && reqGpuId < int(reqGpuNum) { // two pointers
			if idleGpuMilli, ok := idleGpus[devId]; ok && idleGpuMilli >= reqGpuMilli {
				candDevIdList = append(candDevIdList, devId)
				idleGpus[devId] = idleGpuMilli - reqGpuMilli
				reqGpuId++
			} else {
				devId++
			}
		}
		if reqGpuId == int(reqGpuNum) {
			candDevId = strconv.Itoa(candDevIdList[0])
			for _, id := range candDevIdList[1:] {
				candDevId += fmt.Sprintf("%s%d", utils.DevIdSep, id)
			}
			found = true
		}
	}

	return candDevId, found
}

// device index -> idle GPU milli
func (n *GpuNodeInfo) getIdleGpus() (idleGpus map[int]int64) {
	usedGpus := n.getUsedGpus()
	//unhealthyGpus := n.getUnhealthyGpus()
	idleGpus = map[int]int64{}
	for id, usedGpuMilli := range usedGpus {
		idleGpus[id] = utils.MILLI - usedGpuMilli
	}
	return idleGpus
}

// device index -> used GPU milli
func (n *GpuNodeInfo) getUsedGpus() (usedGpus map[int]int64) {
	usedGpus = map[int]int64{}
	for _, dev := range n.devs {
		usedGpus[dev.idx] = dev.GetUsedGpuMilli()
	}
	//log.Printf("info: getUsedGpus: %v in node %s, and devs %v", usedGpus, n.name, n.devs)
	return usedGpus
}

type GpuNodeInfoStr struct {
	DevsBrief    map[int]*DeviceInfoBrief
	GpuCount     int
	GpuModel     string
	GpuUsedMilli int64
	NumPods      int
}

func (n *GpuNodeInfo) ExportGpuNodeInfoAsStr() *GpuNodeInfoStr {
	var numPods int
	var gpuUsedMilli int64
	devsBrief := map[int]*DeviceInfoBrief{}
	for idx, d := range n.devs {
		dib := d.ExportDeviceInfoBrief()
		gpuUsedMilli += dib.GpuUsedMilli
		devsBrief[idx] = dib
		numPods += len(dib.PodList)
	}
	return &GpuNodeInfoStr{devsBrief, n.gpuCount, n.model, gpuUsedMilli, numPods}
}
