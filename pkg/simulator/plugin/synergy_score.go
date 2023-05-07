package plugin

import (
	"context"

	v1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/kubernetes/pkg/scheduler/framework"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	gpushareutils "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

type SynergyScorePlugin struct {
	handle framework.Handle
}

var _ framework.ScorePlugin = &SynergyScorePlugin{}

func NewSynergyScorePlugin(_ runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	return &SynergyScorePlugin{
		handle: handle,
	}, nil
}

func (plugin *SynergyScorePlugin) Name() string {
	return simontype.SynergyScorePluginName
}

func (plugin *SynergyScorePlugin) Score(_ context.Context, _ *framework.CycleState, p *v1.Pod, nodeName string) (int64, *framework.Status) {
	nodeResPtr, podResPtr := utils.GetNodeResourceAndPodResourceViaHandle(p, nodeName, plugin.handle)
	if nodeResPtr == nil || podResPtr == nil {
		return framework.MinNodeScore, framework.NewStatus(framework.Error, "failed to get nodeRes or podRes")
	}

	// TODO: when there exists gpu share, do we just simply add up all the remaining gpu resources for comparison?
	// The machine with the least remaining GPU resources has the highest score.
	return framework.MaxNodeScore * (gpushareutils.MaxSpecGpu - nodeResPtr.GetTotalMilliGpuLeft()) / gpushareutils.MaxSpecGpu, framework.NewStatus(framework.Success)
}

func (plugin *SynergyScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return nil
}
