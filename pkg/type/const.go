package simontype

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

const (
	SimonPluginName                          = "Simon"
	OpenGpuSharePluginName                   = "Open-Gpu-Share"
	GpuFragScorePluginName                   = "GpuFragScore"
	GpuFragBellmanScorePluginName            = "GpuFragBellmanScore"
	GpuFragSimScorePluginName                = "GpuFragSimScore"
	GpuShareFragScorePluginName              = "GpuShareFragScore"
	GpuShareFragExtendScorePluginName        = "GpuShareFragExtendScore"
	GpuShareFragLinearNormScorePluginName    = "GpuShareFragLinearNormScore"
	GpuShareFragSimScorePluginName           = "GpuShareFragSimScore"
	GpuShareFragSimLinearNormScorePluginName = "GpuShareFragSimLinearNormScore"
	GpuShareFragSimTuneScorePluginName       = "GpuShareFragSimTuneScore"
	GpuShareFragBestFitScorePluginName       = "GpuShareFragBestFitScore"
	GpuShareFragDotProductScorePluginName    = "GpuShareFragDotProductScore"
	GpuShareFragL2NormRatioScorePluginName   = "GpuShareFragL2NormRatioScore"
	GpuShareFragPackingScorePluginName       = "GpuShareFragPackingScore"
	CosineSimilarityPluginName               = "CosineSimilarityScore"
	GpuPackingScorePluginName                = "GpuPackingScore"
	CosineSimPackingPluginName               = "CosineSimPackingScore"
	GpuPackingSimScorePluginName             = "GpuPackingSimScore"
	BestFitScorePluginName                   = "BestFitScore"
	WorstFitScorePluginName                  = "WorstFitScore"
	FirstFitScorePluginName                  = "FirstFitScore"
	RandomScorePluginName                    = "RandomScore"
	DotProductScorePluginName                = "DotProductScore"
	L2NormDiffScorePluginName                = "L2NormDiffScore"
	L2NormRatioScorePluginName               = "L2NormRatioScore"
	GandivaScorePluginName                   = "GandivaScore"
	NewNodeNamePrefix                        = "simon"
	DefaultSchedulerName                     = "simon-scheduler"

	StopReasonSuccess   = "everything is ok"
	StopReasonDoNotStop = "do not stop"
	CreatePodError      = "failed to create pod"
	DeletePodError      = "failed to delete pod"

	AnnoWorkloadKind      = "simon/workload-kind"
	AnnoWorkloadName      = "simon/workload-name"
	AnnoWorkloadNamespace = "simon/workload-namespace"
	AnnoNodeLocalStorage  = "simon/node-local-storage"
	AnnoPodLocalStorage   = "simon/pod-local-storage"
	AnnoNodeGpuShare      = "simon/node-gpu-share"
	AnnoPodUnscheduled    = "simon/pod-unscheduled"

	LabelNewNode = "simon/new-node"
	LabelAppName = "simon/app-name"

	EnvMaxCPU    = "MaxCPU"
	EnvMaxMemory = "MaxMemory"
	EnvMaxVG     = "MaxVG"

	Pod                   = "Pod"
	Deployment            = "Deployment"
	ReplicaSet            = "ReplicaSet"
	ReplicationController = "ReplicationController"
	StatefulSet           = "StatefulSet"
	DaemonSet             = "DaemonSet"
	Job                   = "Job"
	CronJob               = "CronJob"

	HostName = "kubernetes.io/hostname"
	NodeIp   = "node-ip"

	ConfigMapName      = "simulator-plan"
	ConfigMapNamespace = metav1.NamespaceSystem
	ConfigMapFileName  = "configmap-simon.yaml"

	NotesFileSuffix       = "NOTES.txt"
	SeparateSymbol        = "-"
	WorkLoadHashCodeDigit = 10
	PodHashCodeDigit      = 5
	MaxNumNewNode         = 0
	MaxNumGpuPerNode      = 8
)
