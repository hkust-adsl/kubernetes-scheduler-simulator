package simulator

import (
	"container/heap"
	"math"

	log "github.com/sirupsen/logrus"
	corev1 "k8s.io/api/core/v1"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

const (
	DeschedulePolicyCosSim       = "cosSim"
	DeschedulePolicyFragOnePod   = "fragOnePod"
	DeschedulePolicyFragMultiPod = "fragMultiPod"
)

func (sim *Simulator) DescheduleCluster() []simontype.UnscheduledPod {
	podMap := sim.getCurrentPodMap()

	nodeStatus := sim.GetClusterNodeStatus() // Note: the resources in nodeStatus.Node is the capacity instead of requests
	nodeResMap := utils.GetNodeResourceMap(nodeStatus)

	var failedPods []simontype.UnscheduledPod
	numPodsToDeschedule := int(math.Ceil(sim.customConfig.DescheduleConfig.Ratio * float64(len(podMap))))
	log.Infof("maximum number of pods that can be descheduled: %d, deschedule policy: %s\n",
		numPodsToDeschedule, sim.customConfig.DescheduleConfig.Policy)

	switch sim.customConfig.DescheduleConfig.Policy {
	case DeschedulePolicyCosSim:
		failedPods = sim.descheduleClusterOnCosSim(numPodsToDeschedule, nodeStatus, nodeResMap, podMap)

	case DeschedulePolicyFragOnePod:
		failedPods = sim.descheduleClusterOnFragOnePod(numPodsToDeschedule, nodeStatus, nodeResMap, podMap)

	case DeschedulePolicyFragMultiPod:
		failedPods = sim.descheduleClusterOnFragMultiPod(numPodsToDeschedule, nodeStatus, nodeResMap, podMap)

	default:
		log.Errorf("DeschedulePolicy not found\n")
	}

	log.Infof("[DescheduleCluster] Num of Failed Pods: %d\n", len(failedPods))
	return failedPods
}

func (sim *Simulator) descheduleClusterOnCosSim(numPodsToDeschedule int, nodeStatus []simontype.NodeStatus,
	nodeResMap map[string]simontype.NodeResource, podMap map[string]*corev1.Pod) []simontype.UnscheduledPod {

	milliCpuBar := int64(2000) // temporarily hard-code
	milliGpuBar := int64(500)
	sortNodeStatusByResource(milliCpuBar, nodeStatus, nodeResMap)

	var descheduledPodKeys []string
	for _, ns := range nodeStatus {
		if numPodsToDeschedule <= 0 {
			break
		}
		// nodeFilter
		nodeRes := nodeResMap[ns.Node.Name]
		if nodeRes.MilliCpuLeft >= milliCpuBar {
			continue
		}
		gpuBarPass := false
		for _, v := range nodeRes.MilliGpuLeftList {
			if v > milliGpuBar {
				gpuBarPass = true
				break
			}
		}
		if !gpuBarPass {
			continue
		}

		victimPod := sim.findVictimPodOnCosSim(nodeRes, ns.Pods)
		if victimPod != nil {
			if err := sim.deletePod(victimPod); err != nil {
				log.Errorf("[descheduleClusterOnCosSim] failed to delete pod(%s)\n",
					utils.GeneratePodKey(victimPod))
			} else {
				descheduledPodKeys = append(descheduledPodKeys, utils.GeneratePodKey(victimPod))
				numPodsToDeschedule -= 1
			}
		}
	}
	sim.ClusterAnalysis(TagPostEviction)
	descheduledPod := getPodfromPodMap(descheduledPodKeys, podMap)
	log.Infof("[DescheduleCluster] Num of Descheduled Pods: %d\n", len(descheduledPod))
	return sim.SchedulePods(descheduledPod)
}

func (sim *Simulator) descheduleClusterOnFragOnePod(numPodsToDeschedule int, nodeStatus []simontype.NodeStatus,
	nodeResMap map[string]simontype.NodeResource, podMap map[string]*corev1.Pod) []simontype.UnscheduledPod {
	nodeStatusMap := make(map[string]simontype.NodeStatus)
	for _, ns := range nodeStatus {
		nodeStatusMap[ns.Node.Name] = ns
	}

	var descheduledPodKeys []string
	nodeFragAmountList := sim.getNodeFragAmountList(nodeStatus)
	for _, nfa := range nodeFragAmountList { // from nodes with the largest amount of fragment
		if numPodsToDeschedule <= 0 {
			break
		}
		nsPods := nodeStatusMap[nfa.NodeName].Pods
		victimPod, _ := sim.findVictimPodOnNodeFragAware(nfa, nodeResMap[nfa.NodeName], nsPods) // evict one pod per node
		if victimPod != nil {
			descheduledPodKeys = append(descheduledPodKeys, utils.GeneratePodKey(victimPod))
			sim.deletePod(victimPod)
			numPodsToDeschedule -= 1
		}
	}
	sim.ClusterAnalysis(TagPostEviction)
	descheduledPod := getPodfromPodMap(descheduledPodKeys, podMap)
	log.Infof("[DescheduleCluster] Num of Descheduled Pods: %d\n", len(descheduledPod))
	return sim.SchedulePods(descheduledPod)
}

func (sim *Simulator) descheduleClusterOnFragMultiPod(numPodsToDeschedule int, nodeStatus []simontype.NodeStatus,
	nodeResMap map[string]simontype.NodeResource, podMap map[string]*corev1.Pod) []simontype.UnscheduledPod {
	var descheduledPodKeys []string
	nodeFragAmountMap := sim.NodeGpuFragAmountMap(nodeResMap)

	i := 0
	nodeFragQueue := make(PriorityQueue, len(nodeFragAmountMap))
	for _, v := range nodeFragAmountMap {
		nodeFragQueue[i] = &Item{
			value:    v,
			priority: v.FragAmountSumExceptQ3(),
			index:    i,
		}
		i++
	}
	heap.Init(&nodeFragQueue)

	tempNodeStatusMap := make(map[string]simontype.NodeStatus)
	for _, ns := range nodeStatus {
		tempNodeStatusMap[ns.Node.Name] = ns // should not touch ns.Node since it is a pointer
	}

	nodeDescheduleCount := make(map[string]int)
	popCount := 0
	for numPodsToDeschedule > 0 {
		if nodeFragQueue.Len() == 0 {
			break
		}

		popCount += 1
		item := heap.Pop(&nodeFragQueue).(*Item)
		log.Debugf(" POP: [%d][pri:%.2f] %s\n", popCount, item.priority, item.value.Repr())
		nodeFragQueue.show()

		nsPods := tempNodeStatusMap[item.value.NodeName].Pods
		victimPod, victimNodeGpuFrag := sim.findVictimPodOnNodeFragAware(item.value, nodeResMap[item.value.NodeName], nsPods) // evict one pod per node
		if victimPod != nil {
			descheduledPodKeys = append(descheduledPodKeys, utils.GeneratePodKey(victimPod))
			nodeDescheduleCount[item.value.NodeName] += 1
			sim.deletePod(victimPod)

			item.value = *victimNodeGpuFrag
			item.priority = victimNodeGpuFrag.FragAmountSumExceptQ3()
			nodeFragQueue.Push(item) // update the nodeFragQueue
			nodeFragQueue.show()

			oldNode := tempNodeStatusMap[item.value.NodeName].Node                                      // not changed
			newPods := utils.RemovePodFromPodSliceByPod(nsPods, victimPod)                              // remove one pod
			tempNodeStatusMap[item.value.NodeName] = simontype.NodeStatus{Node: oldNode, Pods: newPods} // update the nodeStatus
			numPodsToDeschedule -= 1
		}
	}
	log.Debugf("[DescheduleCluster] nodeDescheduleCount: %v\n", nodeDescheduleCount)
	sim.ClusterAnalysis(TagPostEviction)
	descheduledPod := getPodfromPodMap(descheduledPodKeys, podMap)
	log.Infof("[DescheduleCluster] Num of Descheduled Pods: %d\n", len(descheduledPod))
	return sim.SchedulePods(descheduledPod)
}
