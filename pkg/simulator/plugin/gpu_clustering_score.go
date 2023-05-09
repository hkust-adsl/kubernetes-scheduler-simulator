package plugin

import (
	"context"
	"fmt"

	v1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/kubernetes/pkg/scheduler/framework"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	gpushareutils "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

type GpuClusteringScorePlugin struct {
	handle framework.Handle
}

var _ framework.ScorePlugin = &GpuClusteringScorePlugin{}

func NewGpuClusteringScorePlugin(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	return &GpuClusteringScorePlugin{
		handle: handle,
	}, nil
}

func (plugin *GpuClusteringScorePlugin) Name() string {
	return simontype.GpuClusteringScorePluginName
}

func (plugin *GpuClusteringScorePlugin) Score(_ context.Context, _ *framework.CycleState, p *v1.Pod, nodeName string) (int64, *framework.Status) {
	nodeResPtr, podResPtr := utils.GetNodeResourceAndPodResourceViaHandle(p, nodeName, plugin.handle)
	if nodeResPtr == nil || podResPtr == nil {
		return framework.MinNodeScore, framework.NewStatus(framework.Error, fmt.Sprintf("failed to get nodeRes or podRes"))
	}

	podGpuAffinity := gpushareutils.GetGpuAffinityFromPodAnnotation(p)
	if podGpuAffinity != gpushareutils.NoGpuTag { // (0, 100]: request GPU
		if nodeResPtr.GpuAffinity[podGpuAffinity] > 0 {
			if len(nodeResPtr.GpuAffinity) == 1 { // (75, 100]: node with the only same affinity
				return framework.MaxNodeScore/4*(gpushareutils.MaxSpecGpu-nodeResPtr.GetTotalMilliGpuLeft())/gpushareutils.MaxSpecGpu + framework.MaxNodeScore*3/4, framework.NewStatus(framework.Success)
			} else { // (50, 75]: node with multiple affinities including the pod affinity
				return framework.MaxNodeScore/4*(gpushareutils.MaxSpecGpu-nodeResPtr.GetTotalMilliGpuLeft())/gpushareutils.MaxSpecGpu + framework.MaxNodeScore*2/4, framework.NewStatus(framework.Success)
			}
		} else {
			if len(nodeResPtr.GpuAffinity) == 0 { // (25, 50]: idle machine with no affinity
				return framework.MaxNodeScore/4*(gpushareutils.MaxSpecGpu-nodeResPtr.GetTotalMilliGpuLeft())/gpushareutils.MaxSpecGpu + framework.MaxNodeScore/4, framework.NewStatus(framework.Success)
			} else { // (0, 25]: node with different affinities
				return framework.MaxNodeScore / 4 * (gpushareutils.MaxSpecGpu - nodeResPtr.GetTotalMilliGpuLeft()) / gpushareutils.MaxSpecGpu, framework.NewStatus(framework.Success)
			}
		}
	} else { // 0: request no GPU
		return framework.MinNodeScore, framework.NewStatus(framework.Success)
	}
}

func (plugin *GpuClusteringScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return nil
}
