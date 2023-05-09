package simulator

import (
	"context"
	"testing"
	"time"

	log "github.com/sirupsen/logrus"
	"github.com/stretchr/testify/assert"
	"k8s.io/client-go/informers"
	externalclientset "k8s.io/client-go/kubernetes"

	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/api/v1alpha1"
)

func TestGenerateWorkloadInflationPods(t *testing.T) {
	var client externalclientset.Interface
	ctx, cancel := context.WithCancel(context.Background())
	options := defaultSimulatorOptions
	sim := &Simulator{
		client:          client,
		informerFactory: informers.NewSharedInformerFactory(client, 0),
		ctx:             ctx,
		cancelFunc:      cancel,
		customConfig:    options.customConfig,
	}

	sim.customConfig.TypicalPodsConfig = v1alpha1.TypicalPodsConfig{IsInvolvedCpuPods: true, PodPopularityThreshold: 95, PodIncreaseStep: 1, GpuResWeight: 0}
	customConfig := sim.GetCustomConfig()
	resources, _ := CreateClusterResourceFromClusterConfig(customConfig.NewWorkloadConfig)
	pods, _ := GetValidPodExcludeDaemonSet(resources)
	sim.SetWorkloadPods(pods)

	sim.SetTypicalPods()
	log.Infof("TypicalPodsConfig: %v\n", sim.customConfig.TypicalPodsConfig)
	assert.Equal(t, "s", "s")
}

func TestSortPodsByTimestamp(t *testing.T) {
	creationTime := "2022-08-01T10:48:26+08:00"
	deletionTime := "2022-08-21T00:46:07+08:00"
	ci, _ := time.Parse(time.RFC3339, creationTime)
	di, _ := time.Parse(time.RFC3339, deletionTime)

	assert.Equal(t, true, ci.Before(di))
	assert.Equal(t, false, di.Before(ci))
	assert.Equal(t, false, ci.Before(ci))

	var tj time.Time // undefined goes before all values
	assert.Equal(t, true, tj.Before(ci))
	assert.Equal(t, false, ci.Before(tj))
	assert.Equal(t, true, tj.Before(di))
	assert.Equal(t, false, di.Before(tj))

	var ti time.Time // undefined
	assert.Equal(t, false, tj.Before(ti))
	assert.Equal(t, false, ti.Before(tj))
}
