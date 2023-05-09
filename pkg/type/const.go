package simontype

const (
	SimonPluginName        = "Simon"
	OpenGpuSharePluginName = "Open-Gpu-Share"

	RandomScorePluginName        = "RandomScore"
	DotProductScorePluginName    = "DotProductScore"
	GpuClusteringScorePluginName = "GpuClusteringScore"
	GpuPackingScorePluginName    = "GpuPackingScore"
	BestFitScorePluginName       = "BestFitScore"
	FGDScorePluginName           = "FGDScore"

	NewNodeNamePrefix    = "simon"
	DefaultSchedulerName = "simon-scheduler"

	CreatePodError = "failed to create pod"
	DeletePodError = "failed to delete pod"

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

	NotesFileSuffix       = "NOTES.txt"
	SeparateSymbol        = "-"
	WorkLoadHashCodeDigit = 10
	PodHashCodeDigit      = 5
	MaxNumGpuPerNode      = 8
)
