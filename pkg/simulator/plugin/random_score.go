package plugin

import (
	"context"
	"fmt"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/kubernetes/pkg/scheduler/framework"
	"math/rand"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
)

type RandomScorePlugin struct {
	handle framework.Handle
}

var _ framework.ScorePlugin = &RandomScorePlugin{}

const preScoreStateKey = "PreScore-RandomScorePlugin"

// preScoreState computed at PreScore and used at Score.
type preScoreState struct {
	nodeName string
}

// Clone implements the mandatory Clone interface. We don't really copy the data
func (s *preScoreState) Clone() framework.StateData {
	return s
}

func NewRandomScorePlugin(configuration runtime.Object, handle framework.Handle) (framework.Plugin, error) {
	return &RandomScorePlugin{
		handle: handle,
	}, nil
}

func (plugin *RandomScorePlugin) Name() string {
	return simontype.RandomScorePluginName
}

func (plugin *RandomScorePlugin) PreScore(ctx context.Context, cycleState *framework.CycleState, pod *corev1.Pod, nodes []*corev1.Node) *framework.Status {
	n := len(nodes)
	idx := rand.Intn(n)
	nodeName := nodes[idx].Name
	state := &preScoreState{
		nodeName: nodeName,
	}
	cycleState.Write(preScoreStateKey, state)
	return nil
}

func (plugin *RandomScorePlugin) Score(ctx context.Context, state *framework.CycleState, pod *corev1.Pod, nodeName string) (int64, *framework.Status) {
	c, err := state.Read(preScoreStateKey)
	if err != nil {
		return 0, framework.AsStatus(fmt.Errorf("reading %q from cycleState: %w", preScoreStateKey, err))
	}
	s, ok := c.(*preScoreState)
	if !ok {
		return 0, framework.AsStatus(fmt.Errorf("cannot convert saved state to tainttoleration.preScoreState"))
	}

	if nodeName == s.nodeName {
		return framework.MaxNodeScore, framework.NewStatus(framework.Success)
	} else {
		return framework.MinNodeScore, framework.NewStatus(framework.Success)
	}
}

func (plugin *RandomScorePlugin) ScoreExtensions() framework.ScoreExtensions {
	return nil
}
