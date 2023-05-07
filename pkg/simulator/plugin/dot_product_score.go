package plugin

import (
	"context"
	"fmt"
	"math"

	log "github.com/sirupsen/logrus"
	v1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/kubernetes/pkg/scheduler/framework"
	frameworkruntime "k8s.io/kubernetes/pkg/scheduler/framework/runtime"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

// DotProductScorePlugin implements the packing heuristics proposed by Tetris.
// https://dl.acm.org/doi/10.1145/2619239.2626334
type DotProductScorePlugin struct {
	cfg    *simontype.GpuPluginCfg
	handle framework.Handle
}

var _ framework.ScorePlugin = &DotProductScorePlugin{}

func NewDotProductScorePlugin(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	var cfg *simontype.GpuPluginCfg
	if err := frameworkruntime.DecodeInto(configuration, &cfg); err != nil {
		return nil, err
	}

	plugin := &DotProductScorePlugin{
		cfg:    cfg,
		handle: handle,
	}
	allocateGpuIdFunc[plugin.Name()] = allocateGpuIdBasedOnDotProduct
	return plugin, nil
}

func (plugin *DotProductScorePlugin) Name() string {
	return simontype.DotProductScorePluginName
}

func (plugin *DotProductScorePlugin) Score(ctx context.Context, state *framework.CycleState,
	p *v1.Pod, nodeName string) (int64, *framework.Status) {

	nodeResPtr := utils.GetNodeResourceViaHandleAndName(plugin.handle, nodeName)
	if nodeResPtr == nil {
		return framework.MinNodeScore, framework.NewStatus(framework.Error,
			fmt.Sprintf("failed to get nodeRes(%s)\n", nodeName))
	}
	nodeRes := *nodeResPtr
	podRes := utils.GetPodResource(p)

	score, _ := calculateDotProductScore(nodeRes, podRes, *plugin.cfg)
	return score, framework.NewStatus(framework.Success)
}

func (plugin *DotProductScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return nil
}

func calculateDotProductScore(nodeRes simontype.NodeResource, podRes simontype.PodResource,
	cfg simontype.GpuPluginCfg) (int64, string) {

	var score float64 = -1
	var gpuId = ""

	matchGroups := utils.GenerateSchedulingMatchGroups(nodeRes, podRes, cfg.DimExtMethod, cfg.NormMethod)
	for _, matchGroup := range matchGroups {
		curScore := utils.CalculateVectorDotProduct(matchGroup.NodeResourceVec, matchGroup.PodResourceVec)
		if curScore == -1 {
			continue
		}
		if cfg.NormMethod == simontype.NormByNode || cfg.NormMethod == simontype.NormByMax {
			curScore /= float64(len(matchGroup.PodResourceVec)) // normalize to [0, 1]
		} else if cfg.NormMethod == simontype.NormByPod {
			curScore /= float64(len(matchGroup.PodResourceVec))
			curScore = math.Tanh(curScore / 10) // normalize to [0, 1], tanh(0.1) = 9.6% as min score (precisely 1 Pod), tanh(2.0) = 96.4% as saturated score (20 Pods available)
		} else {
			panic(fmt.Sprintf("undefined normalization for dot product: %v", cfg.NormMethod))
		}
		curScore = 1 - curScore // the larger the dot product, the lower the score

		log.Tracef("dot product score between nodeVec(%v) and podVec(%v): %.4f\n",
			matchGroup.NodeResourceVec, matchGroup.PodResourceVec, curScore)

		if score < curScore {
			score = curScore
			gpuId = matchGroup.GpuId
		}
	}

	if score == -1 {
		return framework.MinNodeScore, ""
	}

	return int64(float64(framework.MaxNodeScore) * score), gpuId
}

func allocateGpuIdBasedOnDotProduct(nodeRes simontype.NodeResource, podRes simontype.PodResource,
	cfg simontype.GpuPluginCfg, _ *simontype.TargetPodList) (gpuId string) {

	_, gpuId = calculateDotProductScore(nodeRes, podRes, cfg)
	return gpuId
}
