package plugin

import (
	"context"
	"fmt"
	"math"

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

// GpuShareFragSimTuneScorePlugin is a plugin for scheduling framework, scoring pods by GPU fragmentation amount
type GpuShareFragSimTuneScorePlugin struct {
	cfg          *simontype.GpuPluginCfg
	handle       framework.Handle
	typicalPods  *simontype.TargetPodList
	fragGpuRatio float64
}

// Just to check whether the implemented struct fits the interface
var _ framework.ScorePlugin = &GpuShareFragSimTuneScorePlugin{}

func NewGpuShareFragSimTuneScorePlugin(configuration runtime.Object, handle framework.Handle, typicalPods *simontype.TargetPodList) (framework.Plugin, error) {
	var cfg *simontype.GpuPluginCfg
	if err := frameworkruntime.DecodeInto(configuration, &cfg); err != nil {
		return nil, err
	}

	gpuFragScorePlugin := &GpuShareFragSimTuneScorePlugin{
		cfg:          cfg,
		handle:       handle,
		typicalPods:  typicalPods,
		fragGpuRatio: 0.0,
	}
	allocateGpuIdFunc[gpuFragScorePlugin.Name()] = allocateGpuIdBasedOnCosineSimilarity
	return gpuFragScorePlugin, nil
}

// Name returns name of the plugin. It is used in logs, etc.
func (plugin *GpuShareFragSimTuneScorePlugin) Name() string {
	return simontype.GpuShareFragSimTuneScorePluginName
}

func (plugin *GpuShareFragSimTuneScorePlugin) PreFilter(ctx context.Context, state *framework.CycleState, pod *corev1.Pod) *framework.Status {
	var frameworkStatus *framework.Status
	nodeInfoList, err := plugin.handle.SnapshotSharedLister().NodeInfos().List()
	if err != nil {
		panic(fmt.Sprintf("Failed to get nodeInfoList: %s", err.Error()))
	}
	plugin.fragGpuRatio, frameworkStatus = PreFilterFragGpuRatio(nodeInfoList, *plugin.typicalPods)
	return frameworkStatus
}

func (plugin *GpuShareFragSimTuneScorePlugin) PreFilterExtensions() framework.PreFilterExtensions {
	return nil
}

// Score invoked at the score extension point.
func (plugin *GpuShareFragSimTuneScorePlugin) Score(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, nodeName string) (int64, *framework.Status) {
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
	nodeGpuShareFragScore := utils.NodeGpuShareFragAmountScore(nodeRes, *plugin.typicalPods)
	newNodeGpuShareFragScore := utils.NodeGpuShareFragAmountScore(newNodeRes, *plugin.typicalPods)
	fragScore := nodeGpuShareFragScore - newNodeGpuShareFragScore         // The higher, the better. Negative means fragment amount increases, which is among the worst cases.
	fragScore = sigmoid(fragScore/1000) * float64(framework.MaxNodeScore) // Sigmoid Norm: [-8000, +8000] => [0, 100]
	log.Debugf("[GSFSSP] node(%s) || %.2f=%.2f-%.2f\n", nodeRes.Repr(), fragScore, nodeGpuShareFragScore, newNodeGpuShareFragScore)
	// </frag score>

	// < cosine similarity score>
	cosScore, _ := calculateCosineSimilarityScore(nodeRes, podRes, *plugin.cfg)
	// </cosine similarity score>

	plugin.fragGpuRatio = math.Sqrt(plugin.fragGpuRatio) // tune the ratio by non-linear scaling: x^(1/i) where i = 2.
	// The larger the i is, the more significant frag ratio becomes in early stage:
	//|   1 |      2 |      3 |      4 |      5 |      6 |      7 |      8 |      9 |     10 |
	//|----:|-------:|-------:|-------:|-------:|-------:|-------:|-------:|-------:|-------:|
	//|   5 |  22.36 |  36.84 |  47.29 |  54.93 |  60.7  |  65.18 |  68.77 |  71.69 |  74.11 |
	//|  10 |  31.62 |  46.42 |  56.23 |  63.1  |  68.13 |  71.97 |  74.99 |  77.43 |  79.43 |
	//|  15 |  38.73 |  53.13 |  62.23 |  68.43 |  72.89 |  76.26 |  78.89 |  80.99 |  82.72 |
	//|  20 |  44.72 |  58.48 |  66.87 |  72.48 |  76.47 |  79.46 |  81.78 |  83.63 |  85.13 |
	//|  25 |  50    |  63    |  70.71 |  75.79 |  79.37 |  82.03 |  84.09 |  85.72 |  87.06 |
	//|  30 |  54.77 |  66.94 |  74.01 |  78.6  |  81.82 |  84.2  |  86.03 |  87.48 |  88.66 |
	//|  35 |  59.16 |  70.47 |  76.92 |  81.06 |  83.95 |  86.07 |  87.7  |  88.99 |  90.03 |
	//|  40 |  63.25 |  73.68 |  79.53 |  83.26 |  85.84 |  87.73 |  89.18 |  90.32 |  91.24 |
	//|  45 |  67.08 |  76.63 |  81.9  |  85.24 |  87.54 |  89.22 |  90.5  |  91.51 |  92.33 |
	//|  50 |  70.71 |  79.37 |  84.09 |  87.06 |  89.09 |  90.57 |  91.7  |  92.59 |  93.3  |
	//|  55 |  74.16 |  81.93 |  86.12 |  88.73 |  90.52 |  91.81 |  92.8  |  93.57 |  94.2  |
	//|  60 |  77.46 |  84.34 |  88.01 |  90.29 |  91.84 |  92.96 |  93.81 |  94.48 |  95.02 |
	//|  65 |  80.62 |  86.62 |  89.79 |  91.75 |  93.07 |  94.03 |  94.76 |  95.33 |  95.78 |
	//|  70 |  83.67 |  88.79 |  91.47 |  93.11 |  94.23 |  95.03 |  95.64 |  96.11 |  96.5  |
	//|  75 |  86.6  |  90.86 |  93.06 |  94.41 |  95.32 |  95.97 |  96.47 |  96.85 |  97.16 |
	//|  80 |  89.44 |  92.83 |  94.57 |  95.64 |  96.35 |  96.86 |  97.25 |  97.55 |  97.79 |
	//|  85 |  92.2  |  94.73 |  96.02 |  96.8  |  97.33 |  97.71 |  97.99 |  98.21 |  98.39 |
	//|  90 |  94.87 |  96.55 |  97.4  |  97.91 |  98.26 |  98.51 |  98.69 |  98.84 |  98.95 |
	//|  95 |  97.47 |  98.3  |  98.73 |  98.98 |  99.15 |  99.27 |  99.36 |  99.43 |  99.49 |
	//| 100 | 100    | 100    | 100    | 100    | 100    | 100    | 100    | 100    | 100    |

	score := int64(fragScore*plugin.fragGpuRatio + float64(cosScore)*(1.0-plugin.fragGpuRatio))
	log.Debugf("[Score][%s] %d = fragScore[%5.2f] * fragGpuRatio[%5.2f%%] + cosScore[%d] * (1-fragGpuRatio)\n", nodeName, score, fragScore, 100*plugin.fragGpuRatio, cosScore)

	return score, framework.NewStatus(framework.Success)
}

// ScoreExtensions of the Score plugin.
func (plugin *GpuShareFragSimTuneScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return plugin
}

// NormalizeScore invoked after scoring all nodes.
func (plugin *GpuShareFragSimTuneScorePlugin) NormalizeScore(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, scores framework.NodeScoreList) *framework.Status {
	return NormalizeScore(scores)
}
