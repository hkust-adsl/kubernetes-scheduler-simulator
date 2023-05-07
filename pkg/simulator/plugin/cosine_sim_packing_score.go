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

type CosineSimPackingPlugin struct {
	cfg    *simontype.GpuPluginCfg
	handle framework.Handle
}

var _ framework.ScorePlugin = &CosineSimPackingPlugin{}

func NewCosineSimPackingPlugin(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	var cfg *simontype.GpuPluginCfg
	if err := frameworkruntime.DecodeInto(configuration, &cfg); err != nil {
		return nil, err
	}

	plugin := &CosineSimPackingPlugin{
		cfg:    cfg,
		handle: handle,
	}
	allocateGpuIdFunc[plugin.Name()] = allocateGpuIdBasedOnCosineSimilarity
	return plugin, nil
}

func (plugin *CosineSimPackingPlugin) Name() string {
	return simontype.CosineSimPackingPluginName
}

func (plugin *CosineSimPackingPlugin) Score(ctx context.Context, state *framework.CycleState, pod *v1.Pod, nodeName string) (int64, *framework.Status) {
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

	// < cosine similarity score>
	scoreCosSim, _ := calculateCosineSimilarityScore(nodeRes, podRes, *plugin.cfg)
	similarity := float64(scoreCosSim) / float64(framework.MaxNodeScore) // range: 0-1
	// </cosine similarity score>

	// < packing score>
	packingScore, _ := getPackingScore(nodeRes, podRes)
	// </packing score>

	// combine two scores with multiplication
	score := int64(similarity * float64(packingScore))

	return score, framework.NewStatus(framework.Success)
}

func (plugin *CosineSimPackingPlugin) ScoreExtensions() framework.ScoreExtensions {
	return nil
}
