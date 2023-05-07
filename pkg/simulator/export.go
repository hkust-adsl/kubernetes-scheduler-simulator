package simulator

import (
	"encoding/csv"
	"fmt"
	"os"
	"strconv"
	"strings"

	log "github.com/sirupsen/logrus"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/cli-runtime/pkg/printers"

	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	gpushareutils "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/utils"
)

func (sim *Simulator) ExportPodSnapshotInYaml(unschedulePods []simontype.UnscheduledPod, filePath string) {
	var err error
	if filePath == "" {
		log.Infof("[ExportPodSnapshotInYaml] the file path is empty\n")
		return
	}

	var podList *corev1.PodList
	podList, err = sim.client.CoreV1().Pods(corev1.NamespaceAll).List(sim.ctx, metav1.ListOptions{})
	if err != nil {
		log.Errorf("[ExportPodSnapshotInYaml] failed to get pod list\n")
		return
	}

	var file *os.File
	file, err = os.Create(filePath)
	if err != nil {
		log.Errorf("[ExportPodSnapshotInYaml] failed to create file(%s)\n", filePath)
		return
	}
	defer file.Close()

	y := printers.YAMLPrinter{}
	for _, p := range podList.Items {
		pod := p.DeepCopy()
		if pod.Spec.NodeSelector == nil {
			pod.Spec.NodeSelector = map[string]string{}
		}
		if pod.Spec.NodeName == "" {
			MarkPodUnscheduledAnno(pod)
		} else {
			strSlice := strings.Split(pod.Spec.NodeName, "-")
			if len(strSlice) == 4 { // e.g., "0001-paib-node-0100" after commit bd22d0c63350cde0e76201812f7288268cd4cba0, see #L544 in simulator/simulator.go
				pod.Spec.NodeName = fmt.Sprintf("%s-%s-%s", strSlice[1], strSlice[2], strSlice[3]) // e.g., "paib-node-0100"
			}
			pod.Spec.NodeSelector[simontype.HostName] = pod.Spec.NodeName
			pod.Spec.NodeName = ""
			pod.Status = corev1.PodStatus{}
		}
		err = y.PrintObj(pod, file)
		if err != nil {
			log.Errorf("[ExportPodSnapshotInYaml] failed to export pod(%s) yaml to file(%s)\n",
				utils.GeneratePodKey(pod), filePath)
			return
		}
	}

	for _, unschedulePod := range unschedulePods {
		pod := unschedulePod.Pod.DeepCopy()
		MarkPodUnscheduledAnno(pod)
		err = y.PrintObj(pod, file)
		if err != nil {
			log.Errorf("[ExportPodSnapshotInYaml] failed to export pod(%s) yaml to file(%s)\n",
				utils.GeneratePodKey(pod), filePath)
			return
		}
	}
}

func (sim *Simulator) ExportPodSnapshotInCSV(filePath string) {
	log.Infof("[ExportPodSnapshotInCSV] export pod snapshot to csv file(%s)\n", filePath)
	var file *os.File
	var err error
	file, err = os.Create(filePath)
	if err != nil {
		log.Errorf("[ExportPodSnapshotInCSV] failed to create file(%s): %v\n", filePath, err)
		return
	}
	defer file.Close()

	writer := csv.NewWriter(file)

	nodeStatus := sim.GetClusterNodeStatus()
	nodeIpMap := make(map[string]string)
	nodeGpuTypeMap := make(map[string]string)
	for _, ns := range nodeStatus {
		node := ns.Node
		nodeName := node.Name
		nodeIp := node.ObjectMeta.Labels[simontype.NodeIp]
		nodeIpMap[nodeName] = nodeIp
		nodeGpuTypeMap[nodeName] = gpushareutils.GetGpuModelOfNode(node)
	}

	var podList *corev1.PodList
	podList, err = sim.client.CoreV1().Pods(corev1.NamespaceAll).List(sim.ctx, metav1.ListOptions{})
	if err != nil {
		log.Errorf("[ExportPodSnapshotInYaml] failed to get pod list\n")
		return
	}

	header := []string{
		"pod", "namespace", "ip", "cpu_milli", "memory_mib",
		"num_gpu", "gpu_index", "gpu_mem_ratio", "gpu_milli",
		"model", "gpu_mem_mib_each", "gpu_mem_mib", "gpu_type_req", "creation_time",
	}

	err = writer.Write(header)
	if err != nil {
		return
	}

	for _, p := range podList.Items {
		var data []string

		// pod
		name := p.Name
		data = append(data, name)

		// namespace
		namespace := p.Namespace
		data = append(data, namespace)

		// ip
		nodeName := p.Spec.NodeName
		if nodeIp, ok := nodeIpMap[nodeName]; !ok {
			data = append(data, "")
		} else {
			data = append(data, nodeIp)
		}

		// cpu_milli
		podRes := utils.GetPodResource(&p)
		podCpu := podRes.MilliCpu
		data = append(data, strconv.FormatInt(podCpu, 10))

		// memory_mib: skip
		data = append(data, "")

		// num_gpu
		podGpu := int64(podRes.GpuNumber)
		data = append(data, strconv.FormatInt(podGpu, 10))

		// gpu_index
		podGpuIndex := gpushareutils.GetGpuIdFromAnnotation(&p)
		data = append(data, podGpuIndex)

		// gpu_mem_ratio
		podGpuMemRatio := podRes.MilliGpu / 10
		data = append(data, strconv.FormatInt(podGpuMemRatio, 10))

		// gpu_milli
		podGpuMilli := podRes.MilliGpu
		data = append(data, strconv.FormatInt(podGpuMilli, 10))

		// model (GPU type of the node)
		model, ok := nodeGpuTypeMap[nodeName]
		if !ok || model == "" {
			model = "CPU"
		}
		data = append(data, model)

		// gpu_mem_mib_each (GPU mem capacity of the node)
		gpuMemMibEach, ok := gpushareutils.MapGpuTypeMemoryMiB[model]
		if !ok {
			gpuMemMibEach = 0
		}
		data = append(data, strconv.FormatInt(gpuMemMibEach, 10))

		// gpu_mem_mib (GPU request of the pod)
		podGpuMemMib := podRes.MilliGpu * gpuMemMibEach / 1000
		data = append(data, strconv.FormatInt(podGpuMemMib, 10))

		// gpu_type_req (GPU type requirement of the pod)
		podGpuTypeReq := podRes.GpuType
		if podGpuTypeReq == "" {
			podGpuTypeReq = "<none>"
		}
		data = append(data, podGpuTypeReq)

		// creation_time
		if creationTime, ok := p.Annotations[gpushareutils.CreationTime]; ok {
			data = append(data, creationTime)
		} else {
			data = append(data, "")
		}
		err = writer.Write(data)
		if err != nil {
			return
		}
	}
	writer.Flush()
}

func (sim *Simulator) ExportNodeSnapshotInCSV(filePath string) {
	log.Infof("[ExportNodeSnapshotInCSV] export node snapshot to csv file(%s)\n", filePath)
	var file *os.File
	var err error
	file, err = os.Create(filePath)
	if err != nil {
		log.Errorf("[ExportNodeSnapshotInCSV] failed to create file(%s): %v\n", filePath, err)
		return
	}
	defer file.Close()

	writer := csv.NewWriter(file)

	nodeStatus := sim.GetClusterNodeStatus()
	nodeResMap := utils.GetNodeResourceMap(nodeStatus)

	header := []string{
		"name", "ip", "model", "cpu", "gpu", "memory_mib", "gpu_mem_mib_each", "num_pod",
		"cpu_milli_left", "memory_mib_left",
		"gpu_milli_left_0", "gpu_mem_mib_left_0",
		"gpu_milli_left_1", "gpu_mem_mib_left_1",
		"gpu_milli_left_2", "gpu_mem_mib_left_2",
		"gpu_milli_left_3", "gpu_mem_mib_left_3",
		"gpu_milli_left_4", "gpu_mem_mib_left_4",
		"gpu_milli_left_5", "gpu_mem_mib_left_5",
		"gpu_milli_left_6", "gpu_mem_mib_left_6",
		"gpu_milli_left_7", "gpu_mem_mib_left_7",
		"gpu_milli_left", "gpu_mem_mib_left",
	}
	err = writer.Write(header)
	if err != nil {
		return
	}

	for _, ns := range nodeStatus {
		node := ns.Node
		nodeRes, ok := nodeResMap[node.Name]
		if !ok {
			continue
		}
		var data []string

		name := node.Name
		data = append(data, name)

		ip, _ := node.ObjectMeta.Labels[simontype.NodeIp]
		data = append(data, ip)

		model := gpushareutils.GetGpuModelOfNode(node)
		if model == "" {
			model = "CPU"
		}
		data = append(data, model)

		cpu := node.Status.Capacity.Cpu().Value()
		data = append(data, strconv.FormatInt(cpu, 10))

		gpu := gpushareutils.GetGpuCountOfNode(node)
		data = append(data, strconv.Itoa(gpu))

		memory := node.Status.Capacity.Memory().Value()
		data = append(data, strconv.FormatInt(memory, 10))

		// gpu_mem_mib_each
		gpuMemMibEach, ok := gpushareutils.MapGpuTypeMemoryMiB[model]
		if !ok {
			gpuMemMibEach = 0
		}
		data = append(data, strconv.FormatInt(gpuMemMibEach, 10))

		// num_pod
		numPod := len(ns.Pods)
		data = append(data, strconv.Itoa(numPod))

		// cpu_milli_left
		data = append(data, strconv.FormatInt(nodeRes.MilliCpuLeft, 10))

		// memory_mib_left == capacity (all idle) for now (TODO)
		data = append(data, strconv.FormatInt(memory, 10))

		var gpuMilliLeftTotal int64
		var gpuMemMibLeftTotal int64
		for i := 0; i < 8; i++ {
			// gpu_milli_left_$i
			var gpuMilliLeft int64
			if i < len(nodeRes.MilliGpuLeftList) {
				gpuMilliLeft = nodeRes.MilliGpuLeftList[i]
				gpuMilliLeftTotal += gpuMilliLeft
			}
			data = append(data, strconv.FormatInt(gpuMilliLeft, 10))

			// gpu_mem_mib_left_$i
			gpuMemMibLeft := gpuMilliLeft * gpuMemMibEach / 1000
			gpuMemMibLeftTotal += gpuMemMibLeft
			data = append(data, strconv.FormatInt(gpuMemMibLeft, 10))
		}

		// gpu_milli_left
		data = append(data, strconv.FormatInt(gpuMilliLeftTotal, 10))

		// gpu_mem_mib_left
		data = append(data, strconv.FormatInt(gpuMemMibLeftTotal, 10))

		err = writer.Write(data)
		if err != nil {
			return
		}
	}
	writer.Flush()
}
