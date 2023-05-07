package plugin

import (
	"testing"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/stretchr/testify/assert"
)

func TestCalculateCosineSimilarityScore(t *testing.T) {
	// case-2
	cfg := &simontype.GpuPluginCfg{DimExtMethod: simontype.MergeGpuDim, NormMethod: simontype.NormByNode}
	nodeRes := simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 1000, MilliCpuCapacity: 2000, MilliGpuLeftList: []int64{200, 1000, 1000, 500}, GpuNumber: 4, GpuType: "1080"}
	podRes := simontype.PodResource{MilliCpu: 100, MilliGpu: 1000, GpuNumber: 2, GpuType: "1080"}
	//fmt.Printf("IsNodeAccessibleToPod: %v\n", utils.IsNodeAccessibleToPod(nodeRes, podRes))
	score, _ := calculateCosineSimilarityScore(nodeRes, podRes, *cfg)
	assert.Equal(t, int64(85), score)

	// case-3 4-GPU
	nodeRes = simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 1000, MilliCpuCapacity: 2000, MilliGpuLeftList: []int64{1000, 1000, 1000, 1000}, GpuNumber: 4, GpuType: "1080"}
	podRes = simontype.PodResource{MilliCpu: 100, MilliGpu: 1000, GpuNumber: 2, GpuType: "1080"}
	score, _ = calculateCosineSimilarityScore(nodeRes, podRes, *cfg)
	assert.Equal(t, int64(93), score)

	// case-3 8-GPU
	nodeRes = simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 1000, MilliCpuCapacity: 2000, MilliGpuLeftList: []int64{1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000}, GpuNumber: 8, GpuType: "1080"}
	podRes = simontype.PodResource{MilliCpu: 100, MilliGpu: 1000, GpuNumber: 2, GpuType: "1080"}
	score, _ = calculateCosineSimilarityScore(nodeRes, podRes, *cfg)
	assert.Equal(t, int64(96), score)

	// case-1 only use existing GPUs
	nodeRes = simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 1000, MilliCpuCapacity: 2000, MilliGpuLeftList: []int64{200, 1000, 1000, 500}, GpuNumber: 4, GpuType: "1080"}
	podRes = simontype.PodResource{MilliCpu: 100, MilliGpu: 200, GpuNumber: 2, GpuType: "1080"}
	score, _ = calculateCosineSimilarityScore(nodeRes, podRes, *cfg)
	assert.Equal(t, int64(98), score)
	assert.Equal(t, simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 1000, MilliCpuCapacity: 2000, MilliGpuLeftList: []int64{200, 1000, 1000, 500}, GpuNumber: 4, GpuType: "1080"}, nodeRes) // The order of origin MilliGpuLeftList should not change
}
