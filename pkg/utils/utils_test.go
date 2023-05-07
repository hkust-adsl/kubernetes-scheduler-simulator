package utils

import (
	"testing"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	"github.com/stretchr/testify/assert"
)

func TestGetResourceSimilarity(t *testing.T) {
	podRes := simontype.PodResource{MilliCpu: 500, MilliGpu: 500, GpuNumber: 1, GpuType: "1080"}
	nodeRes := simontype.NodeResource{NodeName: "Node11", MilliCpuLeft: 1000, MilliGpuLeftList: []int64{200, 600, 350, 0}, GpuNumber: 4, GpuType: "1080"}
	assert.InDelta(t, GetResourceSimilarity(nodeRes, podRes), 0.99757510083, 1e-3) //(1000*500+1150*500)/(sqrt((1000^2+1150^2))*sqrt((500^2+500^2)))

	nodeRes = simontype.NodeResource{NodeName: "Node12", MilliCpuLeft: 1000, MilliGpuLeftList: []int64{1000, 150, 0, 0}, GpuNumber: 4, GpuType: "1080"}
	assert.InDelta(t, GetResourceSimilarity(nodeRes, podRes), 0.99757510083, 1e-3) //(1000*500+1150*500)/(sqrt((1000^2+1150^2))*sqrt((500^2+500^2)))
	nodeRes = simontype.NodeResource{NodeName: "Node13", MilliCpuLeft: 500, MilliGpuLeftList: []int64{500, 75, 0, 0}, GpuNumber: 4, GpuType: "1080"}
	assert.InDelta(t, GetResourceSimilarity(nodeRes, podRes), 0.99757510083, 1e-3) //(1000*500+1150*500)/(sqrt((1000^2+1150^2))*sqrt((500^2+500^2)))

	podRes = simontype.PodResource{MilliCpu: 1000, MilliGpu: 10, GpuNumber: 2, GpuType: "1080"}
	nodeRes = simontype.NodeResource{NodeName: "Hello", MilliCpuLeft: 0, MilliGpuLeftList: []int64{1000, 1000}, GpuNumber: 2, GpuType: "P4"}
	assert.InDelta(t, GetResourceSimilarity(nodeRes, podRes), 0.0199960012, 1e-3) //(0*1000+2000*20)/(sqrt((0^2+2000^2))*sqrt((1000^2+20^2)))
}

func TestCalculateVectorDotProduct(t *testing.T) {
	podRes := simontype.PodResource{MilliCpu: 500, MilliGpu: 500, GpuNumber: 1, GpuType: "1080"}

	nodeCap := []float64{2000, 4000}
	nodeRes := simontype.NodeResource{NodeName: "Node11", MilliCpuLeft: 1000, MilliGpuLeftList: []int64{200, 600, 350, 0}, GpuNumber: 4, GpuType: "1080"}
	nodeVec := NormalizeVector(nodeRes.ToResourceVec(), nodeCap) // (0.5, 0.2875)
	podVec := NormalizeVector(podRes.ToResourceVec(), nodeCap)   // (0.25, 0.125)
	assert.InDelta(t, CalculateVectorDotProduct(nodeVec, podVec), 0.1609375, 1e-3)

	nodeRes = simontype.NodeResource{NodeName: "Node12", MilliCpuLeft: 1000, MilliGpuLeftList: []int64{1000, 150, 0, 0}, GpuNumber: 4, GpuType: "1080"}
	nodeVec = NormalizeVector(nodeRes.ToResourceVec(), nodeCap) // (0.5, 0.2875)
	assert.InDelta(t, CalculateVectorDotProduct(nodeVec, podVec), 0.1609375, 1e-3)

	nodeRes = simontype.NodeResource{NodeName: "Node13", MilliCpuLeft: 500, MilliGpuLeftList: []int64{500, 75, 0, 0}, GpuNumber: 4, GpuType: "1080"}
	nodeVec = NormalizeVector(nodeRes.ToResourceVec(), nodeCap) // (0.25, 0.14375)
	assert.InDelta(t, CalculateVectorDotProduct(nodeVec, podVec), 0.08046875, 1e-3)

	podRes = simontype.PodResource{MilliCpu: 1000, MilliGpu: 10, GpuNumber: 2, GpuType: "1080"}
	nodeCap = []float64{2000, 2000}
	nodeRes = simontype.NodeResource{NodeName: "P4", MilliCpuLeft: 0, MilliGpuLeftList: []int64{1000, 1000}, GpuNumber: 2, GpuType: "P4"}
	nodeVec = NormalizeVector(nodeRes.ToResourceVec(), nodeCap) // (0, 1)
	podVec = NormalizeVector(podRes.ToResourceVec(), nodeCap)   // (0.5, 0.01)
	assert.InDelta(t, CalculateVectorDotProduct(nodeVec, podVec), 0.01, 1e-3)

	podRes = simontype.PodResource{MilliCpu: 4000, MilliGpu: 1000, GpuNumber: 1, GpuType: "V100M16"}
	nodeCap = []float64{8000, 1000}
	nodeRes = simontype.NodeResource{NodeName: "V100", MilliCpuLeft: 8000, MilliGpuLeftList: []int64{1000}, GpuNumber: 1, GpuType: "V100M16"}
	nodeVec = NormalizeVector(nodeRes.ToResourceVec(), nodeCap) // (1, 1)
	podVec = NormalizeVector(podRes.ToResourceVec(), nodeCap)   // (0.5, 1)
	assert.InDelta(t, CalculateVectorDotProduct(nodeVec, podVec), 1.5, 1e-3)
}

func TestCalculateL2NormDiff(t *testing.T) {
	podRes := simontype.PodResource{MilliCpu: 500, MilliGpu: 1000, GpuNumber: 2, GpuType: "1080"}
	nodeCap := []float64{2000, 4000}
	nodeRes := simontype.NodeResource{NodeName: "1080", MilliCpuLeft: 1000, MilliGpuLeftList: []int64{200, 600, 350, 0}, GpuNumber: 4, GpuType: "1080"}
	nodeVec := NormalizeVector(nodeRes.ToResourceVec(), nodeCap) // (0.5, 0.2875)
	podVec := NormalizeVector(podRes.ToResourceVec(), nodeCap)   // (0.25, 0.5)
	assert.InDelta(t, CalculateL2NormDiff(nodeVec, podVec), 0.10765625, 1e-3)

	podRes = simontype.PodResource{MilliCpu: 1000, MilliGpu: 10, GpuNumber: 2, GpuType: "1080"}
	nodeCap = []float64{2000, 2000}
	nodeRes = simontype.NodeResource{NodeName: "P4", MilliCpuLeft: 0, MilliGpuLeftList: []int64{1000, 1000}, GpuNumber: 2, GpuType: "P4"}
	nodeVec = NormalizeVector(nodeRes.ToResourceVec(), nodeCap) // (0, 1)
	podVec = NormalizeVector(podRes.ToResourceVec(), nodeCap)   // (0.5, 0.01)
	assert.InDelta(t, CalculateL2NormDiff(nodeVec, podVec), 1.2301, 1e-3)

	podRes = simontype.PodResource{MilliCpu: 4000, MilliGpu: 1000, GpuNumber: 1, GpuType: "V100M16"}
	nodeCap = []float64{8000, 1000}
	nodeRes = simontype.NodeResource{NodeName: "V100", MilliCpuLeft: 8000, MilliGpuLeftList: []int64{1000}, GpuNumber: 1, GpuType: "V100M16"}
	nodeVec = NormalizeVector(nodeRes.ToResourceVec(), nodeCap) // (1, 1)
	podVec = NormalizeVector(podRes.ToResourceVec(), nodeCap)   // (0.5, 1)
	assert.InDelta(t, CalculateL2NormDiff(nodeVec, podVec), 0.25, 1e-3)
}

func TestCalculateVectorCosineSimilarity(t *testing.T) {
	type args struct {
		vec1 []float64
		vec2 []float64
	}
	tests := []struct {
		name string
		args args
		want float64
	}{
		{
			"a",
			args{
				[]float64{0.5, 0.675},
				[]float64{0.05, 0.5},
			},
			0.85880,
		},
		{
			"b",
			args{
				[]float64{0.5, 0.675},
				[]float64{0.05, 0.1},
			},
			0.98492,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			assert.InDeltaf(t, tt.want, CalculateVectorCosineSimilarity(tt.args.vec1, tt.args.vec2), 1e-3, "CalculateVectorCosineSimilarity(%v, %v)", tt.args.vec1, tt.args.vec2)
		})
	}
}
