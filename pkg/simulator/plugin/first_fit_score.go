package plugin

import (
	"context"
	"hash/fnv"
	"strconv"
	"strings"

	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/kubernetes/pkg/scheduler/framework"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
)

type FirstFitScorePlugin struct {
	handle framework.Handle
}

var _ framework.ScorePlugin = &FirstFitScorePlugin{}

func NewFirstFitScorePlugin(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	return &FirstFitScorePlugin{
		handle: handle,
	}, nil
}

func (plugin *FirstFitScorePlugin) Name() string {
	return simontype.FirstFitScorePluginName
}

func (plugin *FirstFitScorePlugin) Score(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, nodeName string) (int64, *framework.Status) {
	// Use the Kubernetes default node list order as FirstFit
	return 100, framework.NewStatus(framework.Success)

	strSlice := strings.Split(nodeName, "-") // e.g., "paib-node-0001"
	var score int64
	if nodeId, err := strconv.ParseInt(strSlice[len(strSlice)-1], 10, 64); err == nil {
		score = nodeId
	} else {
		score = int64(hash(nodeName))
	}
	score = 100 - (score % 101)
	return score, framework.NewStatus(framework.Success)
}

func (plugin *FirstFitScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return nil
}

func hash(s string) uint32 {
	h := fnv.New32a()
	h.Write([]byte(s))
	return h.Sum32()
}
