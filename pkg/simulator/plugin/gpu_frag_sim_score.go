package plugin

import (
	"context"
	"fmt"

	log "github.com/sirupsen/logrus"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	resourcehelper "k8s.io/kubectl/pkg/util/resource"
	"k8s.io/kubernetes/pkg/scheduler/framework"
	frameworkruntime "k8s.io/kubernetes/pkg/scheduler/framework/runtime"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

// Key idea: use cosine similarity to schedule at beginning while switch to frag later.

// GpuFragSimScorePlugin is a plugin for scheduling framework, scoring pods by GPU fragmentation amount
type GpuFragSimScorePlugin struct {
	cfg          *simontype.GpuPluginCfg
	handle       framework.Handle
	typicalPods  *simontype.TargetPodList
	fragGpuRatio float64
}

// Just to check whether the implemented struct fits the interface
var _ framework.ScorePlugin = &GpuFragSimScorePlugin{}

func NewGpuFragSimScorePlugin(configuration runtime.Object, handle framework.Handle, typicalPods *simontype.TargetPodList) (framework.Plugin, error) {
	var cfg *simontype.GpuPluginCfg
	if err := frameworkruntime.DecodeInto(configuration, &cfg); err != nil {
		return nil, err
	}

	gpuFragScorePlugin := &GpuFragSimScorePlugin{
		cfg:          cfg,
		handle:       handle,
		typicalPods:  typicalPods,
		fragGpuRatio: 0.0,
	}
	allocateGpuIdFunc[gpuFragScorePlugin.Name()] = allocateGpuIdBasedOnCosineSimilarity
	return gpuFragScorePlugin, nil
}

// Name returns name of the plugin. It is used in logs, etc.
func (plugin *GpuFragSimScorePlugin) Name() string {
	return simontype.GpuFragSimScorePluginName
}

func (plugin *GpuFragSimScorePlugin) PreFilter(ctx context.Context, state *framework.CycleState, pod *corev1.Pod) *framework.Status {
	var frameworkStatus *framework.Status
	nodeInfoList, err := plugin.handle.SnapshotSharedLister().NodeInfos().List()
	if err != nil {
		panic(fmt.Sprintf("Failed to get nodeInfoList: %s", err.Error()))
	}
	plugin.fragGpuRatio, frameworkStatus = PreFilterFragGpuRatio(nodeInfoList, *plugin.typicalPods)
	return frameworkStatus
}

func (plugin *GpuFragSimScorePlugin) PreFilterExtensions() framework.PreFilterExtensions {
	return nil
}

// Score invoked at the score extension point.
func (plugin *GpuFragSimScorePlugin) Score(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, nodeName string) (int64, *framework.Status) {
	// < common procedure that prepares podRes, nodeRes, newNodeRes for Frag related score plugins>
	if podReq, _ := resourcehelper.PodRequestsAndLimits(pod); len(podReq) == 0 {
		return framework.MaxNodeScore, framework.NewStatus(framework.Success)
	}

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

	newNodeRes, err := nodeRes.Sub(podRes)
	if err != nil {
		log.Errorf(err.Error())
		return framework.MinNodeScore, framework.NewStatus(framework.Error, fmt.Sprintf("Node (%s) %s does not have sufficient resource for pod (%s) %s\n", nodeName, nodeRes.Repr(), pod.Name, podRes.Repr()))
	}

	if plugin.typicalPods == nil {
		log.Errorf("typical pods list is empty\n")
		return framework.MinNodeScore, framework.NewStatus(framework.Error, "typical pods list is empty\n")
	}
	// </common procedure that prepares podRes, nodeRes, newNodeRes for Frag related score plugins>

	// < frag score>
	nodeGpuFrag := utils.NodeGpuFragAmount(nodeRes, *plugin.typicalPods)
	newNodeGpuFrag := utils.NodeGpuFragAmount(newNodeRes, *plugin.typicalPods)
	fragScore := nodeGpuFrag.FragAmountSumExceptQ3() - newNodeGpuFrag.FragAmountSumExceptQ3() // The higher, the better. Negative means fragment amount increases, which is among the worst cases.
	// </frag score>

	// < cosine similarity score>
	cosScore, _ := calculateCosineSimilarityScore(nodeRes, podRes, *plugin.cfg)
	// </cosine similarity score>

	score := int64(fragScore*plugin.fragGpuRatio + float64(cosScore)*(1.0-plugin.fragGpuRatio))
	log.Debugf("[Score][%s] %d = fragScore[%5.2f] * fragGpuRatio[%5.2f%%] + cosScore[%d] * (1-fragGpuRatio)\n", nodeName, score, fragScore, 100*plugin.fragGpuRatio, cosScore)

	return score, framework.NewStatus(framework.Success)
}

// ScoreExtensions of the Score plugin.
func (plugin *GpuFragSimScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return plugin
}

// NormalizeScore invoked after scoring all nodes.
func (plugin *GpuFragSimScorePlugin) NormalizeScore(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, scores framework.NodeScoreList) *framework.Status {
	return NormalizeScore(scores)
}
