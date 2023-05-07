package v1alpha1

type AppInfo struct {
	Name  string `json:"name"`
	Path  string `json:"path"`
	Chart bool   `json:"chart,omitempty"`
}

type Cluster struct {
	CustomCluster string `json:"customConfig,omitempty"`
	KubeConfig    string `json:"kubeConfig,omitempty"`
}

type SimonSpec struct {
	Cluster      Cluster      `json:"cluster"`
	AppList      []AppInfo    `json:"appList"`
	NewNode      string       `json:"newNode"`
	CustomConfig CustomConfig `json:"customConfig,omitempty"`
}

type SimonMetaData struct {
	Name string `json:"name"`
}

type CustomConfig struct {
	ShufflePod              bool                    `json:"shufflePod,omitempty"`
	ExportConfig            ExportConfig            `json:"exportConfig,omitempty"`
	WorkloadInflationConfig WorkloadInflationConfig `json:"workloadInflationConfig,omitempty"`
	WorkloadTuningConfig    WorkloadTuningConfig    `json:"workloadTuningConfig,omitempty"`
	NewWorkloadConfig       string                  `json:"newWorkloadConfig,omitempty"`
	DescheduleConfig        DescheduleConfig        `json:"descheduleConfig,omitempty"`
	TypicalPodsConfig       TypicalPodsConfig       `json:"typicalPodsConfig,omitempty"`
}

type ExportConfig struct {
	PodSnapshotYamlFilePrefix string `json:"podSnapshotYamlFilePrefix,omitempty"`
	NodeSnapshotCSVFilePrefix string `json:"nodeSnapshotCSVFilePrefix,omitempty"`
}

type WorkloadInflationConfig struct {
	Ratio float64 `json:"ratio,omitempty"`
	Seed  int64   `json:"seed,omitempty"`
}

type WorkloadTuningConfig struct { // prune or append pods to match the Ratio * (cluster_GPU_capacity)
	Ratio float64 `json:"ratio,omitempty"` // <= 0 means no effects
	Seed  int64   `json:"seed,omitempty"`
}

type DescheduleConfig struct {
	Ratio  float64 `json:"ratio,omitempty"`
	Policy string  `json:"policy,omitempty"`
}

type TypicalPodsConfig struct {
	IsInvolvedCpuPods      bool    `json:"isInvolvedCpuPods,omitempty"`
	PodPopularityThreshold int     `json:"podPopularityThreshold,omitempty"` // [0-100]
	PodIncreaseStep        int     `json:"podIncreaseStep,omitempty"`
	GpuResWeight           float64 `json:"gpuResWeight,omitempty"`
}

type Simon struct {
	APIVersion string        `json:"apiVersion"`
	Kind       string        `json:"kind"`
	MetaData   SimonMetaData `json:"metadata"`
	Spec       SimonSpec     `json:"spec"`
}
