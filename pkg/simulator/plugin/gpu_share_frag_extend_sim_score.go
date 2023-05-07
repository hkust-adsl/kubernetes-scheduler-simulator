package plugin

import (
	"context"
	"fmt"

	v1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	resourcehelper "k8s.io/kubectl/pkg/util/resource"
	"k8s.io/kubernetes/pkg/scheduler/framework"
	frameworkruntime "k8s.io/kubernetes/pkg/scheduler/framework/runtime"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

type GpuShareFragExtendSimScorePlugin struct {
	cfg          *simontype.GpuPluginCfg
	handle       framework.Handle
	typicalPods  *simontype.TargetPodList
	fragGpuRatio float64
}

var _ framework.ScorePlugin = &GpuShareFragExtendSimScorePlugin{}

func NewGpuShareFragExtendSimScorePlugin(configuration runtime.Object, handle framework.Handle, typicalPods *simontype.TargetPodList) (framework.Plugin, error) {
	var cfg *simontype.GpuPluginCfg
	if err := frameworkruntime.DecodeInto(configuration, &cfg); err != nil {
		return nil, err
	}

	plugin := &GpuShareFragExtendSimScorePlugin{
		cfg:          cfg,
		handle:       handle,
		typicalPods:  typicalPods,
		fragGpuRatio: 0.0,
	}
	allocateGpuIdFunc[plugin.Name()] = allocateGpuIdBasedOnGpuShareFragExtendScore
	return plugin, nil
}

func (plugin *GpuShareFragExtendSimScorePlugin) Name() string {
	return simontype.GpuShareFragExtendSimScorePluginName
}

func (plugin *GpuShareFragExtendSimScorePlugin) PreFilter(ctx context.Context, state *framework.CycleState, p *v1.Pod) *framework.Status {
	var frameworkStatus *framework.Status
	nodeInfoList, err := plugin.handle.SnapshotSharedLister().NodeInfos().List()
	if err != nil {
		panic(fmt.Sprintf("Failed to get nodeInfoList: %s", err.Error()))
	}
	plugin.fragGpuRatio, frameworkStatus = PreFilterFragGpuRatio(nodeInfoList, *plugin.typicalPods)
	return frameworkStatus
}

func (plugin *GpuShareFragExtendSimScorePlugin) PreFilterExtensions() framework.PreFilterExtensions {
	return nil
}

func (plugin *GpuShareFragExtendSimScorePlugin) Score(ctx context.Context, state *framework.CycleState, p *v1.Pod, nodeName string) (int64, *framework.Status) {
	if podReq, _ := resourcehelper.PodRequestsAndLimits(p); len(podReq) == 0 {
		return framework.MaxNodeScore, framework.NewStatus(framework.Success)
	}

	nodeResPtr := utils.GetNodeResourceViaHandleAndName(plugin.handle, nodeName)
	if nodeResPtr == nil {
		return framework.MinNodeScore, framework.NewStatus(framework.Error, fmt.Sprintf("failed to get nodeRes(%s)\n", nodeName))
	}
	nodeRes := *nodeResPtr

	podRes := utils.GetPodResource(p)
	if !utils.IsNodeAccessibleToPod(nodeRes, podRes) {
		return framework.MinNodeScore, framework.NewStatus(framework.Error, fmt.Sprintf("Node (%s) %s does not match GPU type request of pod %s\n", nodeName, nodeRes.Repr(), podRes.Repr()))
	}

	fragScore, _ := calculateGpuShareFragExtendScore(nodeRes, podRes, plugin.typicalPods)
	simScore, _ := calculateCosineSimilarityScore(nodeRes, podRes, *plugin.cfg)
	score := int64(float64(fragScore)*plugin.fragGpuRatio + float64(simScore)*(1.0-plugin.fragGpuRatio))
	//score := int64(float64(fragScore)*0.1 + float64(simScore)*0.9)
	return score, framework.NewStatus(framework.Success)
}

func (plugin *GpuShareFragExtendSimScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return nil
}
