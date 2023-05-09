package plugin

import (
	"context"
	"fmt"

	log "github.com/sirupsen/logrus"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/kubernetes/pkg/scheduler/framework"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	gpushareutils "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

type BestFitScorePlugin struct {
	handle framework.Handle
}

var _ framework.ScorePlugin = &BestFitScorePlugin{}

func NewBestFitScorePlugin(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	return &BestFitScorePlugin{
		handle: handle,
	}, nil
}

func (plugin *BestFitScorePlugin) Name() string {
	return simontype.BestFitScorePluginName
}

func (plugin *BestFitScorePlugin) Score(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, nodeName string) (int64, *framework.Status) {
	// < common procedure that prepares node, podRes, nodeRes>
	nodeResPtr := utils.GetNodeResourceViaHandleAndName(plugin.handle, nodeName)
	if nodeResPtr == nil {
		return framework.MinNodeScore, framework.NewStatus(framework.Error, fmt.Sprintf("failed to get nodeRes(%s)\n", nodeName))
	}
	nodeRes := *nodeResPtr

	podRes := utils.GetPodResource(pod)
	if !utils.IsNodeAccessibleToPod(nodeRes, podRes) {
		log.Errorf("Node (%s) %s does not match GPU type request of pod %s. Should be filtered by GpuSharePlugin", nodeName, nodeRes.Repr(), podRes.Repr())
		return framework.MinNodeScore, framework.NewStatus(framework.Error, fmt.Sprintf("Node (%s) %s does not match GPU type request of pod %s\n", nodeName, nodeRes.Repr(), podRes.Repr()))
	}
	// </common procedure that prepares node, podRes, nodeRes>

	score := getBestFitScore(nodeRes, podRes)
	if score == -1 {
		return framework.MinNodeScore, framework.NewStatus(framework.Error, fmt.Sprintf("the score between node(%s) and pod(%s) is negative, should not happen\n", nodeName, utils.GeneratePodKey(pod)))
	}
	return score, framework.NewStatus(framework.Success)
}

func (plugin *BestFitScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return plugin
}

func (plugin *BestFitScorePlugin) NormalizeScore(ctx context.Context, state *framework.CycleState, p *corev1.Pod, scores framework.NodeScoreList) *framework.Status {
	return NormalizeScore(scores)
}

// BestFit originally assigns a score Σ_{i} weights_{i} (free_{i} - request_{i}) / maxSpec_{i},
//   where i corresponds to one kind of resource, lower is better
// After revision, it scales to [MinNodeScore(0), MaxNodeScore(100)], higher is better
func getBestFitScore(nodeRes simontype.NodeResource, podRes simontype.PodResource) int64 {
	freeVec := nodeRes.ToResourceVec()
	reqVec := podRes.ToResourceVec()
	maxSpecVec := []float64{gpushareutils.MaxSpecCpu, gpushareutils.MaxSpecGpu} // to normalize score
	weights := []float64{0.5, 0.5}                                              // cpu, gpu
	if len(freeVec) != len(weights) || len(reqVec) != len(weights) || len(maxSpecVec) != len(weights) {
		log.Errorf("length not equal, freeVec(%v), reqVec(%v), maxSpecVec(%v), weights(%v)\n", freeVec, reqVec, maxSpecVec, weights)
		return -1
	}

	var score float64 = 0
	for i := 0; i < len(freeVec); i++ {
		if freeVec[i] < reqVec[i] {
			log.Errorf("free resource not enough, freeVec(%v), reqVec(%v), weights(%v)\n", freeVec, reqVec, weights)
			return -1
		}
		score += (freeVec[i] - reqVec[i]) / maxSpecVec[i] * weights[i] // score range: [0, 1], lower is better
	}

	// Given the score in [0, 1], scale it to [0, 100] and take reverse (lower better -> higher better)
	score = (1.0 - score) * float64(framework.MaxNodeScore)
	//if podRes.GpuNumber == 0 {
	//	if nodeRes.GpuNumber == 0 {
	//		return int64(score/2) + framework.MaxNodeScore/2
	//	} else {
	//		return int64(score / 2)
	//	}
	//}

	log.Debugf("[BestFitScore] score(%.4f), freeVec(%v), reqVec(%v), weights(%v)\n", score, freeVec, reqVec, weights)
	return int64(score)
}
