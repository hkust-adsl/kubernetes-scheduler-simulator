package plugin

import (
	"context"
	"fmt"

	log "github.com/sirupsen/logrus"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/kubernetes/pkg/scheduler/framework"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

type WorstFitScorePlugin struct {
	handle framework.Handle
}

var _ framework.ScorePlugin = &WorstFitScorePlugin{}

func NewWorstFitScorePlugin(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	return &WorstFitScorePlugin{
		handle: handle,
	}, nil
}

func (plugin *WorstFitScorePlugin) Name() string {
	return simontype.WorstFitScorePluginName
}

func (plugin *WorstFitScorePlugin) Score(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, nodeName string) (int64, *framework.Status) {
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

	score := getWorstFitScore(nodeRes, podRes)
	if score == -1 {
		return framework.MinNodeScore, framework.NewStatus(framework.Error,
			fmt.Sprintf("the score between node(%s) and pod(%s) is negative, should not happen\n", nodeName, utils.GeneratePodKey(pod)))
	}
	return score, framework.NewStatus(framework.Success)
}

func (plugin *WorstFitScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return plugin
}

func (plugin *WorstFitScorePlugin) NormalizeScore(ctx context.Context, state *framework.CycleState, p *corev1.Pod, scores framework.NodeScoreList) *framework.Status {
	return NormalizeScore(scores)
}

// WorstFit assigns a score Σ_{i} weights_{i} (free_{i} - request_{i}),
// where i corresponds to one kind of resource, higher is better
func getWorstFitScore(nodeRes simontype.NodeResource, podRes simontype.PodResource) int64 {
	freeVec := nodeRes.ToResourceVec()
	reqVec := podRes.ToResourceVec()
	weights := []float64{1, 100} // cpu, gpu memory
	if len(freeVec) != len(weights) || len(reqVec) != len(weights) {
		log.Errorf("length not equal, freeVec(%v), reqVec(%v), weights(%v)\n", freeVec, reqVec, weights)
		return -1
	}

	var score float64 = 0
	for i := 0; i < len(freeVec); i++ {
		if freeVec[i] < reqVec[i] {
			log.Errorf("free resource not enough, freeVec(%v), reqVec(%v), weights(%v)\n", freeVec, reqVec, weights)
			return -1
		}
		score += (freeVec[i] - reqVec[i]) * weights[i]
	}
	log.Debugf("[WorstFitScore] score(%.4f), freeVec(%v), reqVec(%v), weights(%v)\n",
		score, freeVec, reqVec, weights)
	return int64(score)
}
