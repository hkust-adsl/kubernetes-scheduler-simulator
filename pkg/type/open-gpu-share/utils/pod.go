package utils

import (
	"fmt"
	"strconv"
	"strings"
	"time"

	v1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/api/resource"
)

// AssignedNonTerminatedPod selects pods that are assigned and non-terminal (scheduled and running).
func AssignedNonTerminatedPod(pod *v1.Pod) bool {
	if pod.DeletionTimestamp != nil {
		return false
	}

	if len(pod.Spec.NodeName) == 0 {
		return false
	}
	if pod.Status.Phase == v1.PodSucceeded || pod.Status.Phase == v1.PodFailed {
		return false
	}
	return true
}

// IsCompletePod determines if the pod is complete
func IsCompletePod(pod *v1.Pod) bool {
	if pod.DeletionTimestamp != nil {
		return true
	}

	if pod.Status.Phase == v1.PodSucceeded || pod.Status.Phase == v1.PodFailed {
		return true
	}
	return false
}

// GetGpuIdFromAnnotation gets GPU ID from Annotation, could be "1" or "0-1-2-3" for multi-GPU allocations
func GetGpuIdFromAnnotation(pod *v1.Pod) (id string) {
	if len(pod.ObjectMeta.Annotations) > 0 {
		if value, found := pod.ObjectMeta.Annotations[DeviceIndex]; found {
			id += value
		}
	}
	return id
}

// GetGpuIdListFromAnnotation gets GPU ID List from Annotation, could be [1] or [0, 1, 2, 3] for multi-GPU allocations
func GetGpuIdListFromAnnotation(pod *v1.Pod) (idl []int, err error) {
	id := GetGpuIdFromAnnotation(pod)
	return GpuIdStrToIntList(id)
}

// GetGpuMilliFromPodAnnotation gets the GPU (in Milli) of the pod, range: 0-1000
func GetGpuMilliFromPodAnnotation(pod *v1.Pod) (gpuMilli int64) {
	if len(pod.ObjectMeta.Annotations) > 0 {
		if value, found := pod.ObjectMeta.Annotations[ResourceName]; found {
			if q, err := resource.ParseQuantity(value); err == nil {
				gpuMilli += q.Value()
			}
		}
	}
	//log.Printf("debug: pod %s in ns %s with status %v has GPU Mem %d", pod.Name, pod.Namespace, pod.Status.Phase, gpuMilli)
	return gpuMilli
}

func GetGpuModelFromPodAnnotation(pod *v1.Pod) (gpuType string) {
	if len(pod.ObjectMeta.Annotations) > 0 {
		if value, found := pod.ObjectMeta.Annotations[ModelName]; found {
			gpuType += value
		}
	}
	return gpuType
}

// GetGpuCountFromPodAnnotation gets the GPU Count of the pod
func GetGpuCountFromPodAnnotation(pod *v1.Pod) (gpuCount int) {
	if len(pod.ObjectMeta.Annotations) > 0 {
		if value, found := pod.ObjectMeta.Annotations[CountName]; found {
			if val, err := strconv.Atoi(value); err == nil && val >= 0 {
				gpuCount += val
			}
		}
	}
	//log.Printf("debug: pod %s in ns %s with status %v has GPU Count %d", pod.Name, pod.Namespace, pod.Status.Phase, gpuCount)
	return gpuCount
}

// GetGpuAffinityFromPodAnnotation returns the gpu affinity of the pod
func GetGpuAffinityFromPodAnnotation(p *v1.Pod) (affinity string) {
	gpuCount := GetGpuCountFromPodAnnotation(p)
	gpuMilli := GetGpuMilliFromPodAnnotation(p)
	if gpuCount == 0 {
		return NoGpuTag
	} else if gpuCount == 1 && gpuMilli < MILLI {
		return ShareGpuTag
	} else if gpuCount >= 1 && gpuMilli == MILLI {
		return fmt.Sprintf("%d-gpu", gpuCount)
	} else {
		panic(fmt.Sprintf("unknown gpu affinity, gpu count = %d, gpu milli = %d", gpuCount, gpuMilli))
	}
}

func GetCreationTimeFromPodAnnotation(p *v1.Pod) (t *time.Time) {
	if creationTime, ok := p.Annotations[CreationTime]; ok {
		value, err := time.Parse(time.RFC3339, creationTime)
		if err != nil {
			return nil
		}
		return &value
	}
	return nil
}

func GetDeletionTimeFromPodAnnotation(p *v1.Pod) (t *time.Time) {
	if deletionTime, ok := p.Annotations[DeletionTime]; ok {
		value, err := time.Parse(time.RFC3339, deletionTime)
		if err != nil {
			return nil
		}
		return &value
	}
	return nil
}

// GpuIdStrToIntList follows the string formed in func (n *GpuNodeInfo) AllocateGpuId
func GpuIdStrToIntList(id string) (idl []int, err error) {
	if len(id) <= 0 {
		return idl, nil
	}
	res := strings.Split(id, DevIdSep) // like "2-3-4" -> [2, 3, 4]
	for _, idxStr := range res {
		if idx, e := strconv.Atoi(idxStr); e == nil {
			idl = append(idl, idx)
		} else {
			return idl, e
		}
	}
	return idl, nil
}

// UpdatePodDeviceAnnoSpec updates pod env with devId
func UpdatePodDeviceAnnoSpec(oldPod *v1.Pod, devId string) (newPod *v1.Pod) {
	newPod = oldPod.DeepCopy()
	if newPod.ObjectMeta.Annotations == nil {
		newPod.ObjectMeta.Annotations = map[string]string{}
	}

	now := time.Now()
	newPod.ObjectMeta.Annotations[DeviceIndex] = devId
	newPod.ObjectMeta.Annotations[AssumeTime] = fmt.Sprintf("%d", now.UnixNano())
	return newPod
}

func RemovePodDeviceAnnoSpec(oldPod *v1.Pod) (newPod *v1.Pod) {
	newPod = oldPod.DeepCopy()
	if newPod.ObjectMeta.Annotations == nil {
		newPod.ObjectMeta.Annotations = map[string]string{}
	}

	delete(newPod.ObjectMeta.Annotations, DeviceIndex)
	delete(newPod.ObjectMeta.Annotations, AssumeTime)
	return newPod
}

func GeneratePodKey(pod *v1.Pod) string {
	return GeneratePodKeyByName(pod.Namespace, pod.Name)
}

func GeneratePodKeyByName(namespace, name string) string {
	return namespace + PodNsNameSep + name
}
