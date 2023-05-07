package plugin

import (
	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestGpuPackingScorePlugin_Score(t *testing.T) {
	// case-2
	nodeRes := simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 1000, MilliCpuCapacity: 96000, MilliGpuLeftList: []int64{200, 1000, 1000, 500}, GpuNumber: 4, GpuType: "1080"}
	podRes := simontype.PodResource{MilliCpu: 100, MilliGpu: 1000, GpuNumber: 2, GpuType: "1080"}
	//fmt.Printf("IsNodeAccessibleToPod: %v\n", utils.IsNodeAccessibleToPod(nodeRes, podRes))
	score, _ := getPackingScore(nodeRes, podRes)
	assert.Equal(t, int64(48), score)

	// case-3 4-GPU
	nodeRes = simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 1000, MilliCpuCapacity: 96000, MilliGpuLeftList: []int64{1000, 1000, 1000, 1000}, GpuNumber: 4, GpuType: "1080"}
	podRes = simontype.PodResource{MilliCpu: 100, MilliGpu: 1000, GpuNumber: 2, GpuType: "1080"}
	score, _ = getPackingScore(nodeRes, podRes)
	assert.Equal(t, int64(29), score)

	// case-3 8-GPU
	nodeRes = simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 1000, MilliCpuCapacity: 96000, MilliGpuLeftList: []int64{1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000}, GpuNumber: 8, GpuType: "1080"}
	podRes = simontype.PodResource{MilliCpu: 100, MilliGpu: 1000, GpuNumber: 2, GpuType: "1080"}
	score, _ = getPackingScore(nodeRes, podRes)
	assert.Equal(t, int64(25), score)

	// case-1 only use existing GPUs
	nodeRes = simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 1000, MilliCpuCapacity: 96000, MilliGpuLeftList: []int64{200, 1000, 1000, 500}, GpuNumber: 4, GpuType: "1080"}
	podRes = simontype.PodResource{MilliCpu: 100, MilliGpu: 200, GpuNumber: 2, GpuType: "1080"}
	score, _ = getPackingScore(nodeRes, podRes)
	assert.Equal(t, int64(93), score)
	assert.Equal(t, simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 1000, MilliCpuCapacity: 96000, MilliGpuLeftList: []int64{200, 1000, 1000, 500}, GpuNumber: 4, GpuType: "1080"}, nodeRes) // The order of origin MilliGpuLeftList should not change
}
