package plugin

import (
	"fmt"
	"math"

	log "github.com/sirupsen/logrus"
	"k8s.io/kubernetes/pkg/scheduler/framework"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

// PreFilterFragGpuRatio return the fragGpuRatio (0.0-1.0) of the current cluster,
//	 i.e., how many of the idle GPUs are fragment.
//   Its output should be cached to plugin.fragGpuRatio to avoid re-computation.
//   It should be called before filter to avoid the change of visible nodes.
func PreFilterFragGpuRatio(nodeInfoList []*framework.NodeInfo, typicalPods simontype.TargetPodList) (float64, *framework.Status) {
	data := make([]float64, len(utils.FragRatioDataMap))
	clusterFragAmount := utils.NewFragAmount("cluster", data)

	var nodeCnt int = 0
	for _, nodeInfo := range nodeInfoList {
		nodeResPtr := utils.GetNodeResourceViaNodeInfo(nodeInfo)
		nodeFragAmount := utils.NodeGpuShareFragAmount(*nodeResPtr, typicalPods)
		log.Debugf("[DEBUG][plugin.PreFilterFragGpuRatio] calc [%d] node(%s) frag (%.2f): %s\n", nodeCnt, nodeInfo.Node().Name, nodeFragAmount.FragAmountSumExceptQ3(), nodeFragAmount.Repr())
		if err := clusterFragAmount.AddFragAmount(nodeFragAmount); err != nil {
			return 0.0, framework.NewStatus(framework.Error, fmt.Sprintf("[ClusterAnalysis] %s\n", err.Error()))
		}
		nodeCnt += 1
	}

	var idleGpuMilli float64
	for _, v := range utils.FragRatioDataMap { // 7 entries
		idleGpuMilli += clusterFragAmount.Data[v]
	}
	log.Debugf("[DEBUG][plugin.PreFilterFragGpuRatio] idleGpuMilli of %d nodes: %.2f\n", nodeCnt, idleGpuMilli)

	val := clusterFragAmount.FragAmountSumExceptQ3()
	fragGpuRatio := val / idleGpuMilli
	log.Debugf("FragPlugin fragGpuRatio: %.2f%%\n", fragGpuRatio*100)
	return fragGpuRatio, framework.NewStatus(framework.Success)
}

// NormalizeScore in Score Extension.
//   Reused by all plugins whose scores might go beyond 0(framework.MinNodeScore)--100(framework.MaxNodeScore)
func NormalizeScore(scores framework.NodeScoreList) *framework.Status {
	// Find highest and lowest scores.
	var highest int64 = -math.MaxInt64
	var lowest int64 = math.MaxInt64
	for _, nodeScore := range scores {
		if nodeScore.Score > highest {
			highest = nodeScore.Score
		}
		if nodeScore.Score < lowest {
			lowest = nodeScore.Score
		}
	}
	log.Tracef("[Normalized] highest: %d, lowest: %d\n", highest, lowest)

	// Transform the highest to the lowest score range to fit the framework's min to max node score range.
	oldRange := highest - lowest
	newRange := framework.MaxNodeScore - framework.MinNodeScore
	for i, nodeScore := range scores {
		if oldRange == 0 {
			scores[i].Score = framework.MinNodeScore
		} else {
			scores[i].Score = ((nodeScore.Score - lowest) * newRange / oldRange) + framework.MinNodeScore
		}
		log.Tracef("[Normalized] Node %s, Score: %d\n", scores[i].Name, scores[i].Score)
	}
	return framework.NewStatus(framework.Success)
}

func sigmoid(x float64) float64 { //Sigmoid Activation
	return 1.0 / (1.0 + math.Exp(-x))
}
