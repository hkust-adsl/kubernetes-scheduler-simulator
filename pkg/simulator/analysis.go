package simulator

import (
	"math"
	"sync"

	log "github.com/sirupsen/logrus"
	corev1 "k8s.io/api/core/v1"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	gpushareutils "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

const (
	TagInitSchedule        = "InitSchedule"
	TagPostEviction        = "PostEviction"
	TagPostDeschedule      = "PostDeschedule"
	TagScheduleInflation   = "ScheduleInflation"
	TagDescheduleInflation = "DescheduleInflation"
)

// ClusterGpuFragReport Reports the Gpu Frag Amount of all nodes
func (sim *Simulator) ClusterGpuFragReport() {
	nodeStatus := sim.GetClusterNodeStatus()
	if len(nodeStatus) == 0 {
		return
	}
	if sumRatio := utils.PodListRatioSum(sim.typicalPods); math.Abs(sumRatio-1) > 1e-3 {
		log.Errorf("sim.ClusterGpuFragReport: (%.4f != 1.0): %v\n", sumRatio, sim.typicalPods)
	}

	sim.nodeResourceMap = utils.GetNodeResourceMap(nodeStatus)
	clusterFragAmount := utils.NewFragAmount("cluster", make([]float64, len(utils.FragRatioDataMap)))
	var clusterFragBellman float64
	var clusterUsedNodes int      // num. of used nodes
	var clusterUsedGpus int       // num. of used GPUs
	var clusterUsedGpuMilli int64 // num. of used GPU in Milli
	var clusterTotalGpus int      // num. of total GPUs in the cluster

	var nodeCnt int = 0
	for _, ns := range nodeStatus {
		if nodeRes, ok := sim.nodeResourceMap[ns.Node.Name]; ok {
			clusterFragAmount.AddFragAmount(sim.NodeGpuFragAmount(nodeRes)) // easy to calculate. The regular Frag definition
			clusterFragBellman += utils.NodeGpuFragBellman(nodeRes, sim.typicalPods, &sim.fragMemo, 1.0)
			log.Debugf("[DEBUG][sim.ClusterGpuFragReport] calc [%d] node(%s) frag (%.2f): %s\n", nodeCnt, nodeRes.NodeName, clusterFragAmount.FragAmountSumExceptQ3(), clusterFragAmount.Repr())

			// To calculate the allocation ratio of cluster in an online manner
			clusterTotalGpus += nodeRes.GpuNumber
			if nodeRes.GetFullyFreeGpuNum() < nodeRes.GpuNumber || nodeRes.MilliCpuLeft < nodeRes.MilliCpuCapacity { // the node is used
				clusterUsedNodes += 1
				clusterUsedGpus += nodeRes.GpuNumber // treat all GPUs on that node are "used"
				clusterUsedGpuMilli += int64(nodeRes.GpuNumber*gpushareutils.MILLI) - nodeRes.GetTotalMilliGpuLeft()
			}
		}
		nodeCnt += 1
	}

	var idleGpuMilli float64 // milli GPUs idle in the cluster
	for _, v := range clusterFragAmount.Data {
		idleGpuMilli += v
	}
	log.Debugf("[DEBUG][plugin.ClusterGpuFragReport] idleGpuMilli of %d nodes: %.2f\n", nodeCnt, idleGpuMilli)

	fragGpuMilli := clusterFragAmount.FragAmountSumExceptQ3()
	fragGpuRatio := 100 * fragGpuMilli / idleGpuMilli
	q124GpuRatio := 100 * clusterFragAmount.FragAmountSumQ1Q2Q4() / idleGpuMilli
	log.Infof("[Report]; Frag amount: %.2f; Frag ratio: %.2f%%; Q124 ratio: %.2f%%; (origin)\n", fragGpuMilli, fragGpuRatio, q124GpuRatio)
	log.Infof("[Report]; Frag amount: %.2f; Frag ratio: %.2f%%; (bellman)\n", clusterFragBellman, 100*clusterFragBellman/idleGpuMilli)

	//if clusterTotalGpus*gpushareutils.MILLI-int(idleGpuMilli) != int(clusterUsedGpuMilli) { // this prints unnecessary logs due to the int rounding error
	//	log.Errorf("totalGpuMilli (%d) - idleGpuMilli (%d) != usedGpuMilli (%d)", clusterTotalGpus*gpushareutils.MILLI, idleGpuMilli, clusterUsedGpuMilli)
	//}
	log.Infof("[Alloc]; Used nodes: %d; Used GPUs: %d; Used GPU Milli: %d; Total GPUs: %d; Arrived GPU Milli: %d\n", clusterUsedNodes, clusterUsedGpus, clusterUsedGpuMilli, clusterTotalGpus, sim.arrPodGpuMilli)
}

func (sim *Simulator) ReportFragBasedOnSkyline() {
	nodeStatus := sim.GetClusterNodeStatus()
	sim.nodeResourceMap = utils.GetNodeResourceMap(nodeStatus)
	var clusterIdleMilliGpu int64 = 0
	var clusterFragMilliGpu int64 = 0
	for _, ns := range nodeStatus {
		if nodeRes, ok := sim.nodeResourceMap[ns.Node.Name]; ok {
			fragMilliGpu := utils.NodeGpuFragBasedOnSkyline(nodeRes, sim.skylinePods)
			clusterFragMilliGpu += fragMilliGpu
			idleMilliGpu := nodeRes.GetTotalMilliGpuLeft()
			clusterIdleMilliGpu += idleMilliGpu
		}
	}
	log.Infof("[Skyline] Frag GPU amount: %d, Idle GPU amount: %d, Frag GPU ratio: %.2f%%\n",
		clusterFragMilliGpu, clusterIdleMilliGpu, 100.0*float64(clusterFragMilliGpu)/float64(clusterIdleMilliGpu))
}

func (sim *Simulator) ClusterAnalysis(tag string) (utils.FragAmount, []utils.ResourceSummary) {
	nodeStatus := sim.GetClusterNodeStatus()
	if len(nodeStatus) == 0 {
		return utils.FragAmount{}, nil
	}
	sim.nodeResourceMap = utils.GetNodeResourceMap(nodeStatus)

	ch := make(chan utils.FragAmount)
	for _, ns := range nodeStatus {
		go func(ns simontype.NodeStatus) {
			var nodeFragAmount utils.FragAmount
			if nodeRes, ok := sim.nodeResourceMap[ns.Node.Name]; ok {
				nodeFragAmount = sim.NodeGpuFragAmount(nodeRes)
			} else {
				log.Errorf("nodeName %s not found in nodeResourceMap\n", ns.Node.Name)
			}
			ch <- nodeFragAmount
		}(ns)
	}

	chCount := 0
	data := make([]float64, len(utils.FragRatioDataMap))
	clusterFragAmount := utils.NewFragAmount("cluster", data)
	for nodeFragAmount := range ch {
		if err := clusterFragAmount.AddFragAmount(nodeFragAmount); err != nil {
			log.Errorf("[ClusterAnalysis] %s\n", err.Error())
		}
		log.Tracef("[%3d] Frag %s\n", chCount, nodeFragAmount.Repr())
		chCount += 1
		if chCount == len(nodeStatus) {
			break
		}
	}

	nodeAllocMap, err := utils.GetNodeAllocMap(nodeStatus)
	if err != nil {
		log.Errorf("[ClusterAnalysis] %s\n", err.Error())
	}

	log.Infoln()
	log.Infof("========== Cluster Analysis Results (%s) ==========", tag)
	resourceSummaries := utils.ReportNodeAllocationRate(nodeAllocMap)

	var gpuFragSum float64
	var FragRatioDataReverseMap = map[int]string{}
	for k, v := range utils.FragRatioDataMap {
		val := clusterFragAmount.Data[v]
		gpuFragSum += val
		FragRatioDataReverseMap[v] = k
	}

	for v := 0; v < len(utils.FragRatioDataMap); v++ {
		k := FragRatioDataReverseMap[v]
		val := clusterFragAmount.Data[v]
		log.Infof("%-13s: %6.2f x 10^3 (%5.2f%%)\n", k, val/1000, 100*val/gpuFragSum)
	}
	log.Infoln("--------------------")
	log.Infof("%-13s: %6.2f x 10^3 (100.0%%)\n", "idle_gpu_milli", gpuFragSum/1000)
	val := clusterFragAmount.FragAmountSumExceptQ3()
	log.Infof("%-13s: %6.2f x 10^3 (%5.2f%%)\n", "frag_gpu_milli", val/1000, 100*val/gpuFragSum)
	log.Infoln("==============================================")
	log.Infoln()

	return clusterFragAmount, resourceSummaries
}

func (sim *Simulator) NodeGpuFragAmount(nodeRes simontype.NodeResource) utils.FragAmount {
	if len(sim.typicalPods) <= 0 {
		log.Errorf("Typical pods are not set.\n")
		return utils.FragAmount{}
	}

	nodeResKey := nodeRes.Flatten("origin")
	if fa, ok := sim.fragMemo.Load(nodeResKey); ok {
		if fragData, ok2 := fa.([]float64); ok2 {
			frag := utils.NewFragAmount(nodeRes.NodeName, fragData)
			log.Debugf("[DEBUG][sim.NodeGpuFragAmount] load node(%s) frag (%.2f): %s\n", nodeRes.NodeName, frag.FragAmountSumExceptQ3(), frag.Repr())
			return frag
		}
	} else {
		frag := utils.NodeGpuShareFragAmount(nodeRes, sim.typicalPods)
		sim.fragMemo.Store(nodeResKey, frag.Data)
		log.Debugf("[DEBUG][sim.NodeGpuFragAmount] calc node(%s) frag (%.2f): %s\n", nodeRes.NodeName, frag.FragAmountSumExceptQ3(), frag.Repr())
		return frag
	}
	log.Debugf("[DEBUG][sim.NodeGpuFragAmount] miss node(%s) frag: <NULL>\n", nodeRes.NodeName)
	return utils.FragAmount{}
}

// RecordPodTotalResourceReq will record the total resource requests of all pods,
// and return the list: [total milli cpu request of all pods, total milli gpu request of all pods]
func (sim *Simulator) RecordPodTotalResourceReq(pods []*corev1.Pod) (int64, int64) {
	// initialization
	sim.podTotalMilliCpuReq = 0
	sim.podTotalMilliGpuReq = 0

	// count them all
	for _, p := range pods {
		podRes := utils.GetPodResource(p)
		sim.podTotalMilliCpuReq += podRes.MilliCpu
		sim.podTotalMilliGpuReq += podRes.TotalMilliGpu()
	}
	log.Infof("Total milli cpu request of all pods: %d, milli gpu request: %d\n",
		sim.podTotalMilliCpuReq, sim.podTotalMilliGpuReq)
	return sim.podTotalMilliCpuReq, sim.podTotalMilliGpuReq
}

// RecordNodeTotalResource will record the total resources of all nodes,
// and return the list: [total milli cpu of all nodes, total milli gpu of all nodes]
func (sim *Simulator) RecordNodeTotalResource(nodes []*corev1.Node) (int64, int64) {
	// initialization
	sim.nodeTotalMilliCpu = 0
	sim.nodeTotalMilliGpu = 0

	// count them all
	for _, n := range nodes {
		sim.nodeTotalMilliCpu += n.Status.Capacity.Cpu().MilliValue()
		sim.nodeTotalMilliGpu += int64(gpushareutils.GetGpuMilliOfNode(n))
	}
	log.Infof("Total milli cpu of all nodes: %d, milli gpu: %d\n", sim.nodeTotalMilliCpu, sim.nodeTotalMilliGpu)
	return sim.nodeTotalMilliCpu, sim.nodeTotalMilliGpu
}

func (sim *Simulator) SetTypicalPods() {
	sim.typicalPods = utils.GetTypicalPods(sim.workloadPods, sim.customConfig.TypicalPodsConfig)
	if sumRatio := utils.PodListRatioSum(sim.typicalPods); math.Abs(sumRatio-1) > 1e-3 {
		log.Errorf("sim.SetTypicalPods: (%.4f != 1.0): %v\n", sumRatio, sim.typicalPods)
	}
	sim.fragMemo = sync.Map{}
}

func (sim *Simulator) SetSkylinePods() {
	sim.skylinePods = utils.GetSkylinePods(sim.workloadPods)
}

func (sim *Simulator) NodeGpuFragAmountMap(nodeResourceMap map[string]simontype.NodeResource) map[string]utils.FragAmount {
	nodeFragAmountMap := make(map[string]utils.FragAmount)
	for nodeName, nodeRes := range nodeResourceMap {
		nodeFragAmountMap[nodeName] = sim.NodeGpuFragAmount(nodeRes)
	}
	return nodeFragAmountMap
}
