package simontype

import (
	"fmt"
	"sort"
	"strconv"

	log "github.com/sirupsen/logrus"

	gpushareutils "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
)

type TargetPod struct {
	TargetPodResource PodResource
	Percentage        float64 // range: 0.0 - 1.0 (100%)
}

type TargetPodList []TargetPod

type SkylinePodList []PodResource

func (p TargetPodList) Len() int { return len(p) }
func (p TargetPodList) Less(i, j int) bool {
	if p[i].Percentage != p[j].Percentage {
		return p[i].Percentage < p[j].Percentage
	} else { // to stabilize the order if two TargetPod has the same frequency
		return p[i].TargetPodResource.Less(p[j].TargetPodResource)
	}
}

func (tpr PodResource) Less(other PodResource) bool {
	if tpr.MilliCpu != other.MilliCpu {
		return tpr.MilliCpu < other.MilliCpu
	} else if tpr.MilliGpu != other.MilliGpu {
		return tpr.MilliGpu < other.MilliGpu
	} else if tpr.GpuNumber != other.GpuNumber {
		return tpr.GpuNumber < other.GpuNumber
	} else {
		return tpr.GpuType < other.GpuType
	}
}

func (p TargetPodList) Swap(i, j int) { p[i], p[j] = p[j], p[i] }

const (
	DefaultTypicalPodPopularityThreshold = 60 // 60%
	DefaultTypicalPodIncreaseStep        = 10
)

type PodResource struct { // typical pod, without name and namespace.
	MilliCpu  int64
	MilliGpu  int64 // Milli GPU request per GPU, 0-1000
	GpuNumber int
	GpuType   string
	//Memory	  int64
}

// NodeResource is initialized by utils.GetNodeResourceViaPodList, utils.GetNodeResourceViaHandleAndName, utils.GetNodeResourceViaNodeInfo
type NodeResource struct {
	NodeName         string
	MilliCpuLeft     int64
	MilliCpuCapacity int64
	MilliGpuLeftList []int64 // Do NOT sort it directly, using SortedMilliGpuLeftIndexList instead. Its order matters; the index is the GPU device index.
	GpuNumber        int
	GpuType          string
	GpuAffinity      map[string]int
	// MemoryLeft       int64
	// MemoryCapacity   int64
}

type VirtualPodResource struct {
	ResourceVec []float64
	GpuId       string
}

type VirtualNodeResource struct {
	ResourceVec []float64
	GpuId       string
}

type SchedulingMatchGroup struct {
	NodeResourceVec []float64
	PodResourceVec  []float64
	GpuId           string
}

type GpuResource struct {
	MilliGpuLeft int64
	Id           string
}

type NodeResourceFlat struct {
	MilliCpu int64
	MilliGpu string
	GpuType  string
	Remark   string
	//Memory   int64
}

func (tpr PodResource) Repr() string {
	outStr := "<"
	outStr += fmt.Sprintf("CPU: %6.2f", float64(tpr.MilliCpu)/1000)
	outStr += fmt.Sprintf(", GPU: %d", tpr.GpuNumber)
	outStr += fmt.Sprintf(" x {%-4d}m", tpr.MilliGpu)
	outStr += fmt.Sprintf(" (%s)", tpr.GpuType)
	outStr += ">"
	return outStr
}

func (tpr PodResource) TotalMilliGpu() int64 {
	return tpr.MilliGpu * int64(tpr.GpuNumber)
}

func (tnr NodeResource) Repr() string {
	outStr := fmt.Sprintf("%s<", tnr.NodeName)
	outStr += fmt.Sprintf("CPU: %6.2f/%6.2f", float64(tnr.MilliCpuLeft)/1000, float64(tnr.MilliCpuCapacity)/1000)
	outStr += fmt.Sprintf(", GPU (%s): %d", tnr.GpuType, tnr.GpuNumber)
	if tnr.GpuNumber > 0 {
		outStr += fmt.Sprintf(" x %dm, Left:", gpushareutils.MILLI)
		for _, gML := range tnr.MilliGpuLeftList {
			outStr += fmt.Sprintf(" %dm", gML)
		}
	}
	outStr += ">"
	return outStr
}

func (tnr NodeResource) GetTotalMilliGpuLeft() (total int64) {
	for _, v := range tnr.MilliGpuLeftList {
		total += v
	}
	return total
}

func (tnr NodeResource) GetFullyFreeGpuNum() (free int) {
	for _, gpuMilliLeft := range tnr.MilliGpuLeftList {
		if gpuMilliLeft == gpushareutils.MILLI {
			free++
		}
	}
	return free
}

func (tnr NodeResource) SortedMilliGpuLeftIndexList(ascending bool) []int {
	indexList := make([]int, len(tnr.MilliGpuLeftList)) // len == cap == len(tnr.MilliGpuLeftList)
	for i, _ := range tnr.MilliGpuLeftList {
		indexList[i] = i
	}

	if ascending {
		// smallest one (minimum GPU Milli left) first
		sort.SliceStable(indexList, func(i, j int) bool {
			return tnr.MilliGpuLeftList[indexList[i]] < tnr.MilliGpuLeftList[indexList[j]]
		})
	} else {
		// largest one (maximum GPU Milli left) first
		sort.SliceStable(indexList, func(i, j int) bool {
			return tnr.MilliGpuLeftList[indexList[i]] > tnr.MilliGpuLeftList[indexList[j]]
		})
	}
	return indexList
}

func (tnr NodeResource) Flatten(remark string) NodeResourceFlat {
	nrf := NodeResourceFlat{tnr.MilliCpuLeft, "", tnr.GpuType, remark}

	// Sort NodeRes's GpuLeft in descending
	sortedIndex := tnr.SortedMilliGpuLeftIndexList(false)

	// Append 0 to MilliGpu if number of GPUs is fewer than MaxNumGpuPerNode
	for i := 0; i < MaxNumGpuPerNode; i++ {
		if i < len(sortedIndex) {
			nrf.MilliGpu += fmt.Sprintf("%d,", tnr.MilliGpuLeftList[sortedIndex[i]])
		} else {
			nrf.MilliGpu += "0,"
		}
	}

	return nrf
}

func (tnr NodeResource) ToFormalizedGpuResourceList() (gpuResourceList []GpuResource) {
	var idleGpuNum = 0
	var idleGpuIds = ""
	for id, milliGpuLeft := range tnr.MilliGpuLeftList {
		if milliGpuLeft == gpushareutils.MILLI {
			idleGpuNum++
			if idleGpuIds == "" {
				idleGpuIds = strconv.Itoa(id)
			} else {
				idleGpuIds += fmt.Sprintf("%s%d", gpushareutils.DevIdSep, id)
			}
		} else if milliGpuLeft > 0 {
			gpuResource := GpuResource{
				MilliGpuLeft: milliGpuLeft,
				Id:           strconv.Itoa(id),
			}
			gpuResourceList = append(gpuResourceList, gpuResource)
		}
	}
	if idleGpuNum > 0 {
		gpuResource := GpuResource{
			MilliGpuLeft: int64(idleGpuNum * gpushareutils.MILLI),
			Id:           idleGpuIds,
		}
		gpuResourceList = append(gpuResourceList, gpuResource)
	}
	return gpuResourceList
}

func (tpr PodResource) ToVirtualPodResourceList(method GpuDimExtMethod, nodeRes NodeResource) (virtualPodResourceList []VirtualPodResource) {
	podMilliGpuReq := tpr.MilliGpu * int64(tpr.GpuNumber)

	if method == MergeGpuDim ||
		method == SeparateGpuDimAndShareOtherDim ||
		method == SeparateGpuDimAndDivideOtherDim {

		virtualPodResource := VirtualPodResource{}
		var resourceVec []float64
		// milli cpu request
		resourceVec = append(resourceVec, float64(tpr.MilliCpu))
		// milli gpu request
		resourceVec = append(resourceVec, float64(podMilliGpuReq))
		virtualPodResource.ResourceVec = resourceVec
		virtualPodResourceList = append(virtualPodResourceList, virtualPodResource)
	} else if method == ExtGpuDim {

		nodeFormalizedGpuResourceList := nodeRes.ToFormalizedGpuResourceList()
		for i, nodeGpuResource := range nodeFormalizedGpuResourceList {
			if nodeGpuResource.MilliGpuLeft < podMilliGpuReq {
				continue
			}

			virtualPodResource := VirtualPodResource{}
			var resourceVec []float64
			// milli cpu request
			resourceVec = append(resourceVec, float64(tpr.MilliCpu))
			// milli gpu request
			for j := 0; j < len(nodeFormalizedGpuResourceList); j++ {
				if j == i {
					resourceVec = append(resourceVec, float64(podMilliGpuReq))
				} else {
					resourceVec = append(resourceVec, 0)
				}
			}
			virtualPodResource.ResourceVec = resourceVec
			if nodeGpuResource.MilliGpuLeft < gpushareutils.MILLI { // choose share gpu
				virtualPodResource.GpuId = nodeGpuResource.Id
			} else { // choose idle gpus
				virtualPodResource.GpuId = AllocateExclusiveGpuId(nodeRes, tpr)
			}
			virtualPodResourceList = append(virtualPodResourceList, virtualPodResource)
		}
	} else {
		panic(fmt.Sprintf("undefined gpu dimension extension method: %v", method))
	}

	return virtualPodResourceList
}

func (tnr NodeResource) ToVirtualNodeResourceList(method GpuDimExtMethod, podRes PodResource) (virtualNodeResourceList []VirtualNodeResource) {
	// node cpu resource is not enough to supply the pod
	if tnr.MilliCpuLeft < podRes.MilliCpu {
		return nil
	}

	podMilliGpuReq := podRes.TotalMilliGpu()
	nodeTotalMilliGpuLeft := tnr.GetTotalMilliGpuLeft()

	if method == MergeGpuDim {
		virtualNodeResource := VirtualNodeResource{}
		var resourceVec []float64
		// milli cpu left
		resourceVec = append(resourceVec, float64(tnr.MilliCpuLeft))
		// total milli gpu left
		resourceVec = append(resourceVec, float64(nodeTotalMilliGpuLeft))
		virtualNodeResource.ResourceVec = resourceVec
		virtualNodeResourceList = append(virtualNodeResourceList, virtualNodeResource)
	} else if method == SeparateGpuDimAndShareOtherDim ||
		method == SeparateGpuDimAndDivideOtherDim {

		if podMilliGpuReq < gpushareutils.MILLI { // choose shared gpu
			for id, milliGpuLeft := range tnr.MilliGpuLeftList {
				// ignore idle gpu
				if milliGpuLeft >= gpushareutils.MILLI {
					continue
				}
				// current gpu is not enough to supply the pod
				if milliGpuLeft < podMilliGpuReq {
					continue
				}

				virtualNodeResource := VirtualNodeResource{}
				var resourceVec []float64
				if method == SeparateGpuDimAndShareOtherDim {
					// milli cpu left
					resourceVec = append(resourceVec, float64(tnr.MilliCpuLeft))
				} else {
					// milli cpu left, divided by the percentage of milli gpu left
					resourceVec = append(resourceVec, float64(tnr.MilliCpuLeft*milliGpuLeft)/float64(nodeTotalMilliGpuLeft))
				}
				// milli gpu left
				resourceVec = append(resourceVec, float64(milliGpuLeft))
				virtualNodeResource.ResourceVec = resourceVec
				virtualNodeResource.GpuId = strconv.Itoa(id)
				virtualNodeResourceList = append(virtualNodeResourceList, virtualNodeResource)
			}
		}

		// choose exclusive gpus
		var idleGpuNum = tnr.GetFullyFreeGpuNum()
		if podMilliGpuReq <= int64(idleGpuNum*gpushareutils.MILLI) {
			var selectedExclusiveGpuId = AllocateExclusiveGpuId(tnr, podRes)
			virtualNodeResource := VirtualNodeResource{}
			var resourceVec []float64
			if method == SeparateGpuDimAndShareOtherDim {
				// milli cpu left
				resourceVec = append(resourceVec, float64(tnr.MilliCpuLeft))
			} else {
				// milli cpu left, divided by the percentage of milli gpu left
				resourceVec = append(resourceVec, float64(tnr.MilliCpuLeft*int64(idleGpuNum*gpushareutils.MILLI))/float64(nodeTotalMilliGpuLeft))
			}
			// milli gpu left
			resourceVec = append(resourceVec, float64(idleGpuNum*gpushareutils.MILLI))
			virtualNodeResource.ResourceVec = resourceVec
			virtualNodeResource.GpuId = selectedExclusiveGpuId
			virtualNodeResourceList = append(virtualNodeResourceList, virtualNodeResource)
		}
	} else if method == ExtGpuDim {
		virtualNodeResource := VirtualNodeResource{}
		var resourceVec []float64
		// milli cpu left
		resourceVec = append(resourceVec, float64(tnr.MilliCpuLeft))
		// milli gpu left
		formalizedGpuResourceList := tnr.ToFormalizedGpuResourceList()
		for _, gpuResource := range formalizedGpuResourceList {
			resourceVec = append(resourceVec, float64(gpuResource.MilliGpuLeft))
		}
		virtualNodeResource.ResourceVec = resourceVec
		virtualNodeResourceList = append(virtualNodeResourceList, virtualNodeResource)
	} else {
		panic(fmt.Sprintf("undefined gpu dimension extension method: %v", method))
	}

	return virtualNodeResourceList
}

func AllocateExclusiveGpuId(nodeRes NodeResource, podRes PodResource) (gpuId string) {
	podGpuReq := podRes.TotalMilliGpu()
	for id, milliGpuLeft := range nodeRes.MilliGpuLeftList {
		if podGpuReq <= 0 {
			break
		}
		if milliGpuLeft == gpushareutils.MILLI {
			if gpuId == "" {
				gpuId = strconv.Itoa(id)
			} else {
				gpuId += fmt.Sprintf("%s%d", gpushareutils.DevIdSep, id)
			}
			podGpuReq -= gpushareutils.MILLI
		}
	}
	if podGpuReq > 0 {
		panic("there is no enough exclusive gpu to serve pod, should not happen")
	}

	return gpuId
}

// IsGpuShare returns true if pod is a GPU-share pod, otherwise false.
func (tpr PodResource) IsGpuShare() bool {
	if (tpr.GpuNumber == 1) && (tpr.MilliGpu < gpushareutils.MILLI) {
		return true
	}
	return false
}

// ToResourceVec returns a resource vector: [milli cpu request, milli gpu request].
func (tpr PodResource) ToResourceVec() []float64 {
	var vec []float64
	// milli cpu left
	vec = append(vec, float64(tpr.MilliCpu))

	// milli gpu request, e.g., 500, 2000
	vec = append(vec, float64(tpr.MilliGpu*int64(tpr.GpuNumber)))
	return vec
}

// ToResourceVec returns a resource vector: [milli cpu left, total milli gpu left].
func (tnr NodeResource) ToResourceVec() []float64 {
	var vec []float64
	// milli cpu left
	vec = append(vec, float64(tnr.MilliCpuLeft))

	totalMilliGpuLeft := tnr.GetTotalMilliGpuLeft()
	// total milli gpu left
	vec = append(vec, float64(totalMilliGpuLeft))
	return vec
}

func (tnr NodeResource) Copy() NodeResource {
	milliGpuLeftList := make([]int64, len(tnr.MilliGpuLeftList))
	for i := 0; i < len(tnr.MilliGpuLeftList); i++ {
		milliGpuLeftList[i] = tnr.MilliGpuLeftList[i]
	}

	return NodeResource{
		NodeName:         tnr.NodeName,
		MilliCpuLeft:     tnr.MilliCpuLeft,
		MilliCpuCapacity: tnr.MilliCpuCapacity,
		MilliGpuLeftList: milliGpuLeftList,
		GpuNumber:        tnr.GpuNumber,
		GpuType:          tnr.GpuType,
		GpuAffinity:      tnr.GpuAffinity,
	}
}

func (tnr NodeResource) Sub(tpr PodResource) (NodeResource, error) {
	out := tnr.Copy()
	if out.MilliCpuLeft < tpr.MilliCpu || out.GpuNumber < tpr.GpuNumber {
		return out, fmt.Errorf("node: %s failed to accommodate pod: %s", tnr.Repr(), tpr.Repr())
	}
	out.MilliCpuLeft -= tpr.MilliCpu

	gpuRequest := tpr.GpuNumber
	if gpuRequest == 0 {
		return out, nil
	}

	// Sort NodeRes's GpuLeft in ascending, then Pack it (Subtract from the least sufficient one).
	sortedIndex := out.SortedMilliGpuLeftIndexList(true)

	for i := 0; i < len(sortedIndex); i++ {
		if tpr.MilliGpu <= out.MilliGpuLeftList[sortedIndex[i]] {
			gpuRequest -= 1
			out.MilliGpuLeftList[sortedIndex[i]] -= tpr.MilliGpu
			if gpuRequest <= 0 {
				//fmt.Printf("[DEBUG] [DONE] out.MilliGpuLeftList: %v\n", out.MilliGpuLeftList)
				return out, nil
			}
		}
	}
	return out, fmt.Errorf("node: %s failed to accommodate pod: %s (%d GPU requests left)", tnr.Repr(), tpr.Repr(), gpuRequest)
}

func (tnr NodeResource) Add(tpr PodResource, idl []int) (NodeResource, error) {
	out := tnr.Copy()
	out.MilliCpuLeft += tpr.MilliCpu
	if out.MilliCpuLeft > out.MilliCpuCapacity {
		err := fmt.Errorf("[ERROR] CPU of pod %s + node %s exceeds %d", tpr.Repr(), tnr.Repr(), tnr.MilliCpuCapacity)
		log.Errorln(err.Error())
		out.MilliCpuLeft -= tpr.MilliCpu
		return out, err
	}

	gpuRequest := tpr.GpuNumber
	if tpr.GpuNumber == 0 {
		return out, nil
	}

	if len(idl) > 0 || len(idl) != gpuRequest { // input is valid
		for i := 0; i < len(idl); i++ {
			if idl[i] > len(out.MilliGpuLeftList)-1 || idl[i] < 0 {
				err := fmt.Errorf("[ERROR] idl: %v of pod %s", idl, tpr.Repr())
				log.Errorln(err.Error())
				return out, err
			}
			if out.MilliGpuLeftList[idl[i]]+tpr.MilliGpu > gpushareutils.MILLI {
				err := fmt.Errorf("[ERROR] idl[%d]=%d of pod %s exceeds %d", i, idl[i], tpr.Repr(), gpushareutils.MILLI)
				log.Errorln(err.Error())
				return out, err
			}
			out.MilliGpuLeftList[idl[i]] += tpr.MilliGpu
			gpuRequest -= 1
		}
		return out, nil

	} else { // evict pod from the smallest remaining resource GPU, may not reflect the real cases
		log.Infof("Pod (%s) has no valid GPU index list: %v\n", tpr.Repr(), idl)
		sortedIndex := out.SortedMilliGpuLeftIndexList(true) // smallest one first

		for i := 0; i < len(sortedIndex); i++ {
			if tpr.MilliGpu+out.MilliGpuLeftList[sortedIndex[i]] <= gpushareutils.MILLI {
				gpuRequest -= 1
				out.MilliGpuLeftList[sortedIndex[i]] += tpr.MilliGpu
				if gpuRequest <= 0 {
					//fmt.Printf("[DEBUG] [DONE] out.MilliGpuLeftList: %v\n", out.MilliGpuLeftList)
					return out, nil
				}
			}
		}
	}

	return out, fmt.Errorf("node: %s failed to evict pod: %s (%d GPU requests left)", tnr.Repr(), tpr.Repr(), gpuRequest)
}
