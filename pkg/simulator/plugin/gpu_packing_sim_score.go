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
	gpushareutils "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

type GpuPackingSimScorePlugin struct {
	cfg    *simontype.GpuPluginCfg
	handle framework.Handle
}

var _ framework.ScorePlugin = &GpuPackingSimScorePlugin{}

func NewGpuPackingSimScorePlugin(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	var cfg *simontype.GpuPluginCfg
	if err := frameworkruntime.DecodeInto(configuration, &cfg); err != nil {
		return nil, err
	}

	plugin := &GpuPackingSimScorePlugin{
		cfg:    cfg,
		handle: handle,
	}
	allocateGpuIdFunc[plugin.Name()] = allocateGpuIdBasedOnCosineSimilarity
	return plugin, nil
}

func (plugin *GpuPackingSimScorePlugin) Name() string {
	return simontype.GpuPackingSimScorePluginName
}

func (plugin *GpuPackingSimScorePlugin) Score(ctx context.Context, state *framework.CycleState, pod *v1.Pod, nodeName string) (int64, *framework.Status) {
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
	packBaseScore, _ := getPackingBaseScore(podRes, nodeRes)
	// </packing score>

	// combine two scores with multiplication: Cosine Similarity (0-1) x 33 + Packing base (0 / 33 / 67)
	score := int64(similarity*float64(framework.MaxNodeScore-framework.MinNodeScore)/3) + packBaseScore

	return score, framework.NewStatus(framework.Success)
}

func (plugin *GpuPackingSimScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return nil
}

// score rule, from high to low:
//     case-3. use free GPUs on a free node: return MinNodeScore
//     case-2. use free GPUs on a used node: return MinNodeScore + (MaxNodeScore - MinNodeScore) * 1/3
//     case-1. use shared GPUs:              return MinNodeScore + (MaxNodeScore - MinNodeScore) * 2/3
func getPackingBaseScore(podRes simontype.PodResource, nodeRes simontype.NodeResource) (int64, error) {
	fullyFreeGpuNum := nodeRes.GetFullyFreeGpuNum()

	// case-3: all gpus on the node are free
	if fullyFreeGpuNum == nodeRes.GpuNumber {
		return framework.MinNodeScore, nil
	}

	sortedIndex := nodeRes.SortedMilliGpuLeftIndexList(true) // minimum GPU left first
	var gpuReq = podRes.GpuNumber
	var fullyFreeGpuNumToUse = 0
	var gpuToUse []int
	for _, idx := range sortedIndex {
		if gpuReq == 0 {
			break
		}
		gpuMilliLeft := nodeRes.MilliGpuLeftList[idx]
		if podRes.MilliGpu <= gpuMilliLeft {
			gpuReq--
			gpuToUse = append(gpuToUse, idx)
			if gpuMilliLeft == gpushareutils.MILLI {
				fullyFreeGpuNumToUse++
			}
		}
	}
	if gpuReq != 0 {
		return framework.MinNodeScore, fmt.Errorf("failed to allocate gpu resource to pod(%s) on node(%s)",
			podRes.Repr(), nodeRes.Repr())
	}

	// case-2: have to use fully-free gpus
	if fullyFreeGpuNumToUse > 0 {
		return framework.MinNodeScore + (framework.MaxNodeScore-framework.MinNodeScore)/3, nil
	}

	// case-1: use shared gpus
	return framework.MinNodeScore + 2*(framework.MaxNodeScore-framework.MinNodeScore)/3, nil
}
