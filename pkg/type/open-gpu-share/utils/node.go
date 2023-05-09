package utils

import "k8s.io/api/core/v1"

// IsGpuSharingNode Is the Node for GPU sharing
func IsGpuSharingNode(node *v1.Node) bool {
	return GetGpuMilliOfNode(node) > 0
}

// GetGpuMilliOfNode Get the GPU Milli of the node (0-8000 at most)
func GetGpuMilliOfNode(node *v1.Node) int {
	if milli, ok := node.Status.Capacity[ResourceName]; ok {
		return int(milli.Value())
	}
	return 0
}

// GetGpuCountOfNode Get the GPU count of the node
func GetGpuCountOfNode(node *v1.Node) int {
	if val, ok := node.Status.Capacity[CountName]; ok {
		return int(val.Value())
	}
	return 0
}

// GetGpuModelOfNode Get the GPU Model of the node, see MapGpuTypeMemoryMiB
func GetGpuModelOfNode(node *v1.Node) string {
	if val, ok := node.ObjectMeta.Labels[ModelName]; ok {
		return val
	}
	return ""
}
