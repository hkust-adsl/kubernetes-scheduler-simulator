package plugin

import (
	"context"
	"fmt"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
	log "github.com/sirupsen/logrus"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	resourcehelper "k8s.io/kubectl/pkg/util/resource"
	"k8s.io/kubernetes/pkg/scheduler/framework"
)

// Key idea: Frag & X (X = dot product):
//    use dot product to schedule at beginning while switch to frag later.

// GpuShareFragL2NormRatioScorePlugin is a plugin for scheduling framework, scoring pods by GPU fragmentation amount
type GpuShareFragL2NormRatioScorePlugin struct {
	handle       framework.Handle
	typicalPods  *simontype.TargetPodList
	fragGpuRatio float64
}

// Just to check whether the implemented struct fits the interface
var _ framework.ScorePlugin = &GpuShareFragL2NormRatioScorePlugin{}

func NewGpuShareFragL2NormRatioScorePlugin(configuration runtime.Object, handle framework.Handle, typicalPods *simontype.TargetPodList) (framework.Plugin, error) {
	gpuFragScorePlugin := &GpuShareFragL2NormRatioScorePlugin{
		handle:       handle,
		typicalPods:  typicalPods,
		fragGpuRatio: 0.0,
	}
	return gpuFragScorePlugin, nil
}

// Name returns name of the plugin. It is used in logs, etc.
func (plugin *GpuShareFragL2NormRatioScorePlugin) Name() string {
	return simontype.GpuShareFragL2NormRatioScorePluginName
}

func (plugin *GpuShareFragL2NormRatioScorePlugin) PreFilter(ctx context.Context, state *framework.CycleState, pod *corev1.Pod) *framework.Status {
	var frameworkStatus *framework.Status
	nodeInfoList, err := plugin.handle.SnapshotSharedLister().NodeInfos().List()
	if err != nil {
		panic(fmt.Sprintf("Failed to get nodeInfoList: %s", err.Error()))
	}
	plugin.fragGpuRatio, frameworkStatus = PreFilterFragGpuRatio(nodeInfoList, *plugin.typicalPods)
	return frameworkStatus
}

func (plugin *GpuShareFragL2NormRatioScorePlugin) PreFilterExtensions() framework.PreFilterExtensions {
	return nil
}

// Score invoked at the score extension point.
func (plugin *GpuShareFragL2NormRatioScorePlugin) Score(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, nodeName string) (int64, *framework.Status) {
	// < common procedure that prepares podRes, nodeRes, newNodeRes for Frag related score plugins>
	if podReq, _ := resourcehelper.PodRequestsAndLimits(pod); len(podReq) == 0 {
		return framework.MaxNodeScore, framework.NewStatus(framework.Success)
	}

	node, err := plugin.handle.ClientSet().CoreV1().Nodes().Get(context.Background(), nodeName, metav1.GetOptions{})
	if err != nil {
		return framework.MinNodeScore, framework.NewStatus(framework.Error, fmt.Sprintf("failed to get node %s: %s\n", nodeName, err.Error()))
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
	nodeGpuShareFragScore := utils.NodeGpuShareFragAmountScore(nodeRes, *plugin.typicalPods)
	newNodeGpuShareFragScore := utils.NodeGpuShareFragAmountScore(newNodeRes, *plugin.typicalPods)
	fragScore := nodeGpuShareFragScore - newNodeGpuShareFragScore         // The higher, the better. Negative means fragment amount increases, which is among the worst cases.
	fragScore = sigmoid(fragScore/1000) * float64(framework.MaxNodeScore) // Sigmoid Norm: [-8000, +8000] => [0, 100]
	// </frag score>

	// < l2 norm ratio score>
	nodeCap := utils.GetNodeAllocatableCpuGpu(node)
	nodeVec := utils.NormalizeVector(nodeRes.ToResourceVec(), nodeCap)
	podVec := utils.NormalizeVector(podRes.ToResourceVec(), nodeCap)
	l2NormScore := utils.CalculateL2NormRatio(podVec, nodeVec) // order matters: podVec / nodeVec < 1. The larger the norm ratio, the higher the score
	if l2NormScore == -1 {
		return framework.MinNodeScore, framework.NewStatus(framework.Error)
	}
	l2NormScore /= float64(len(podVec))            // normalize score to [0, 1]
	l2NormScore *= float64(framework.MaxNodeScore) // scale score to [0, 100]
	// </l2 norm ratio score>

	score := int64(fragScore*plugin.fragGpuRatio + l2NormScore*(1.0-plugin.fragGpuRatio))
	log.Debugf("[Score][%s] %d = fragScore[%5.2f] * fragGpuRatio[%5.2f%%] + l2NormScore[%.2f] * (1-fragGpuRatio)\n", nodeName, score, fragScore, 100*plugin.fragGpuRatio, l2NormScore)

	return score, framework.NewStatus(framework.Success)
}

// ScoreExtensions of the Score plugin.
func (plugin *GpuShareFragL2NormRatioScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return plugin
}

// NormalizeScore invoked after scoring all nodes.
func (plugin *GpuShareFragL2NormRatioScorePlugin) NormalizeScore(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, scores framework.NodeScoreList) *framework.Status {
	return NormalizeScore(scores)
}
