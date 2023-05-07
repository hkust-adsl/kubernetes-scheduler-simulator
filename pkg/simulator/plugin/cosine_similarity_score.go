package plugin

import (
	"context"
	"fmt"

	log "github.com/sirupsen/logrus"
	v1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/kubernetes/pkg/scheduler/framework"
	frameworkruntime "k8s.io/kubernetes/pkg/scheduler/framework/runtime"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

type CosineSimilarityPlugin struct {
	cfg    *simontype.GpuPluginCfg
	handle framework.Handle
}

var _ framework.ScorePlugin = &CosineSimilarityPlugin{}

func NewCosineSimilarityPlugin(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	var cfg *simontype.GpuPluginCfg
	if err := frameworkruntime.DecodeInto(configuration, &cfg); err != nil {
		return nil, err
	}

	plugin := &CosineSimilarityPlugin{
		cfg:    cfg,
		handle: handle,
	}
	allocateGpuIdFunc[plugin.Name()] = allocateGpuIdBasedOnCosineSimilarity
	return plugin, nil
}

func (plugin *CosineSimilarityPlugin) Name() string {
	return simontype.CosineSimilarityPluginName
}

func (plugin *CosineSimilarityPlugin) Score(ctx context.Context, state *framework.CycleState, pod *v1.Pod, nodeName string) (int64, *framework.Status) {
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

	score, _ := calculateCosineSimilarityScore(nodeRes, podRes, *plugin.cfg)
	return score, framework.NewStatus(framework.Success)
}

func (plugin *CosineSimilarityPlugin) ScoreExtensions() framework.ScoreExtensions {
	return nil
}

func calculateCosineSimilarityScore(nodeRes simontype.NodeResource, podRes simontype.PodResource,
	cfg simontype.GpuPluginCfg) (score int64, gpuId string) {

	var similarity float64 = -1
	gpuId = ""

	matchGroups := utils.GenerateSchedulingMatchGroups(nodeRes, podRes, cfg.DimExtMethod, cfg.NormMethod)
	for _, matchGroup := range matchGroups {
		curSimilarity := utils.CalculateVectorCosineSimilarity(matchGroup.NodeResourceVec, matchGroup.PodResourceVec)
		if curSimilarity == -1 {
			continue
		}

		log.Tracef("cosine similarity score between nodeVec(%v) and podVec(%v): %.4f\n",
			matchGroup.NodeResourceVec, matchGroup.PodResourceVec, curSimilarity)

		if similarity < curSimilarity {
			similarity = curSimilarity
			gpuId = matchGroup.GpuId
		}
	}

	if similarity == -1 {
		return framework.MinNodeScore, ""
	}

	// The range of cosine similarity: [0, 1]
	// Scale it to [0, 100]
	return int64(float64(framework.MaxNodeScore) * similarity), gpuId
}

func allocateGpuIdBasedOnCosineSimilarity(nodeRes simontype.NodeResource, podRes simontype.PodResource,
	cfg simontype.GpuPluginCfg, _ *simontype.TargetPodList) (gpuId string) {

	_, gpuId = calculateCosineSimilarityScore(nodeRes, podRes, cfg)
	return gpuId
}
