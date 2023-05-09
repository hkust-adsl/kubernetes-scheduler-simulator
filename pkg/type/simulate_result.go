package simontype

import "k8s.io/api/core/v1"

type SimulateResult struct {
	UnscheduledPods []UnscheduledPod
	NodeStatus      []NodeStatus
}

type UnscheduledPod struct {
	Pod    *v1.Pod
	Reason string
}

type NodeStatus struct {
	Node *v1.Node
	Pods []*v1.Pod
}
