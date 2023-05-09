package simulator

import (
	"container/heap"
	"sort"

	log "github.com/sirupsen/logrus"
	corev1 "k8s.io/api/core/v1"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	gpushareutils "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

func (sim *Simulator) findVictimPodOnCosSim(nodeRes simontype.NodeResource, pods []*corev1.Pod) *corev1.Pod {
	var victimPod *corev1.Pod
	var victimPodSimilarity float64 = 1
	for _, pod := range pods {
		podRes := utils.GetPodResource(pod)
		podGpuIdList, err := gpushareutils.GetGpuIdListFromAnnotation(pod)
		if err != nil {
			log.Errorf("[findVictimPodOnCosSim] failed to get podGpuIdList of podRes(%s): %v\n",
				podRes.Repr(), err)
			continue
		}
		newNodeRes, err := nodeRes.Add(podRes, podGpuIdList)
		if err != nil {
			log.Errorf("[findVictimPodOnCosSim] nodeRes(%s) failed to add podRes(%s): %v\n",
				nodeRes.Repr(), podRes.Repr(), err)
			continue
		}

		similarity := utils.GetResourceSimilarity(newNodeRes, podRes)
		if similarity >= 0 && similarity < victimPodSimilarity {
			victimPod = pod
			victimPodSimilarity = similarity
		}
	}
	if victimPod != nil {
		log.Debugf("[findVictimPodOnCosSim] pod(%s) is selected to deschedule from node(%s), resource similarity is %.2f\n",
			utils.GeneratePodKey(victimPod), nodeRes.NodeName, victimPodSimilarity)
		return victimPod
	}
	return nil
}

func sortNodeStatusByResource(milliCpuBar int64, nodeStatus []simontype.NodeStatus, nodeResMap map[string]simontype.NodeResource) {
	sort.SliceStable(nodeStatus, func(i, j int) bool {
		nodeI := nodeStatus[i].Node.Name
		nodeResI := nodeResMap[nodeI]
		milliGpuLeftI := nodeResI.GetTotalMilliGpuLeft()

		nodeJ := nodeStatus[j].Node.Name
		nodeResJ := nodeResMap[nodeJ]
		milliGpuLeftJ := nodeResJ.GetTotalMilliGpuLeft()

		if nodeResI.MilliCpuLeft < milliCpuBar {
			if nodeResJ.MilliCpuLeft < milliCpuBar {
				return milliGpuLeftI > milliGpuLeftJ || (milliGpuLeftI == milliGpuLeftJ && nodeI < nodeJ)
			} else {
				return true
			}
		} else {
			if nodeResJ.MilliCpuLeft < milliCpuBar {
				return false
			} else {
				return milliGpuLeftI > milliGpuLeftJ || (milliGpuLeftI == milliGpuLeftJ && nodeI < nodeJ)
			}
		}
	})
}

func (sim *Simulator) findVictimPodOnNodeFragAware(nodeGpuFrag utils.FragAmount, nodeRes simontype.NodeResource, pods []*corev1.Pod) (*corev1.Pod, *utils.FragAmount) {
	//victimScore := int64(math.MinInt64)
	victimScore := int64(0) // if score < victimScore, i.e., negative, it means descheduling brings more fragment.
	var victimPod *corev1.Pod
	var victimNodeGpuFrag *utils.FragAmount
	log.Debugf(" node:%s (%s)\n", nodeRes.Repr(), nodeRes.NodeName)
	for _, pod := range pods {
		podRes := utils.GetPodResource(pod)
		podGpuIdList, err := gpushareutils.GetGpuIdListFromAnnotation(pod)
		if err != nil {
			log.Errorf("[DescheduleCluster][FragOnePod] podGpuIdList of podRes(%s) error:%s\n", podRes.Repr(), err.Error())
			continue
		}
		newNodeRes, err := nodeRes.Add(podRes, podGpuIdList) // in contrast to schedule's "nodeRes.Sub()"
		if err != nil {
			log.Errorf("[DescheduleCluster][FragOnePod] findVictimPodOnNodeFragAware: nodeRes(%s).Add(podRes(%s)) error:%s\n", nodeRes.Repr(), podRes.Repr(), err.Error())
			continue
		}
		newNodeGpuFrag := sim.NodeGpuFragAmount(newNodeRes)
		score := int64(nodeGpuFrag.FragAmountSumExceptQ3() - newNodeGpuFrag.FragAmountSumExceptQ3()) // same as gpu-frag-score, the higher, the better
		if score > victimScore {
			victimScore = score
			victimPod = pod
			victimNodeGpuFrag = &newNodeGpuFrag
		}
		log.Debugf("  pod:%s, newNodeRes:%s, score:%.2f-%.2f=%d (%s)\n", podRes.Repr(), newNodeRes.Repr(), nodeGpuFrag.FragAmountSumExceptQ3(), newNodeGpuFrag.FragAmountSumExceptQ3(), score, pod.Name)
	}
	if victimPod != nil {
		log.Debugf("[DescheduleCluster][FragOnePod] pod %s is selected to deschedule from node %s, score %d\n", utils.GeneratePodKey(victimPod), nodeGpuFrag.NodeName, victimScore)
		return victimPod, victimNodeGpuFrag
	}
	log.Debugf("[DescheduleCluster][FragOnePod] no pod is evicted from node %s\n", nodeGpuFrag.NodeName)
	return nil, nil
}

// An Item is something we manage in a priority queue.
type Item struct {
	value    utils.FragAmount // The value of the item; arbitrary.
	priority float64          // The priority of the item in the queue.
	// The index is needed by update and is maintained by the heap.Interface methods.
	index int // The index of the item in the heap.
}

// A PriorityQueue implements heap.Interface and holds Items.
type PriorityQueue []*Item

func (pq PriorityQueue) Len() int { return len(pq) }

func (pq PriorityQueue) Less(i, j int) bool {
	// We want Pop to give us the highest, not lowest, priority so we use greater than here.
	return pq[i].priority > pq[j].priority
}

func (pq PriorityQueue) Swap(i, j int) {
	pq[i], pq[j] = pq[j], pq[i]
	pq[i].index = i
	pq[j].index = j
}

func (pq *PriorityQueue) Push(x interface{}) {
	n := len(*pq)
	item := x.(*Item)
	item.index = n
	*pq = append(*pq, item)
	heap.Fix(pq, item.index)
}

func (pq *PriorityQueue) Pop() interface{} {
	old := *pq
	n := len(old)
	item := old[n-1]
	old[n-1] = nil  // avoid memory leak
	item.index = -1 // for safety
	*pq = old[0 : n-1]
	return item
}

// update modifies the priority and value of an Item in the queue.
func (pq *PriorityQueue) update(item *Item, value utils.FragAmount, priority float64) {
	item.value = value
	item.priority = priority
	heap.Fix(pq, item.index)
}

const pqShowLimit = 3

func (pq PriorityQueue) show() {
	for i := 0; i < len(pq) && i < pqShowLimit; i++ {
		log.Debugf("PRIQ: [%d][pri:%.2f] %s\n", pq[i].index, pq[i].priority, pq[i].value.Repr())
	}
	log.Debugln()
}
