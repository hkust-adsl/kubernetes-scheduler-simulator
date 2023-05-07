package utils

import (
	"fmt"
	"math"
	"sort"
	"sync"

	log "github.com/sirupsen/logrus"
	v1 "k8s.io/api/core/v1"

	"github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/api/v1alpha1"
	simontype "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type"
	gpushareutils "github.com/hkust-adsl/kubernetes-scheduler-simulator/pkg/type/open-gpu-share/utils"
)

const (
	Q1LackBoth  = "q1_lack_both"
	Q2LackGpu   = "q2_lack_gpu"
	Q3Satisfied = "q3_satisfied"
	Q4LackCpu   = "q4_lack_cpu"
	XLSatisfied = "xl_satisfied"
	XRLackCPU   = "xr_lack_cpu"
	NoAccess    = "no_access"
)

var FragRatioDataMap = map[string]int{
	Q1LackBoth:  0,
	Q2LackGpu:   1,
	Q3Satisfied: 2,
	Q4LackCpu:   3,
	XLSatisfied: 4,
	XRLackCPU:   5,
	NoAccess:    6,
}

var GpuNumTypeList = []string{"PureCpu", "ShareGpu", "OneGpu", "TwoGpu", "FourGpu", "EightGpu", "Others"}

type FragRatio struct {
	Data []float64
}

type FragAmount struct {
	NodeName string
	Data     []float64
}

func NewFragAmount(nodeName string, data []float64) FragAmount {
	fragAmount := FragAmount{NodeName: nodeName, Data: make([]float64, len(data))}
	copy(fragAmount.Data, data)
	return fragAmount
}

func (fr FragRatio) AddRatio(fragType string, freq float64) error {
	if freq < 0 || freq > 1 {
		return fmt.Errorf("bad freq")
	}
	if index, ok := FragRatioDataMap[fragType]; !ok {
		return fmt.Errorf("bad fragType")
	} else {
		fr.Data[index] += freq
		return nil
	}
}

func (fa FragAmount) AddGamma(faOther FragAmount, gamma float64) error {
	if len(fa.Data) == 0 {
		fa.Data = make([]float64, len(FragRatioDataMap))
		for i := 0; i < len(FragRatioDataMap); i++ {
			fa.Data[i] = 0
		}
	}
	if len(fa.Data) != len(faOther.Data) {
		return fmt.Errorf("this (%d) does not match the other (%d)", len(fa.Data), len(faOther.Data))
	}
	for i := 0; i < len(fa.Data); i++ {
		fa.Data[i] += gamma * faOther.Data[i]
	}
	return nil
}

func (fa FragAmount) AddFragAmount(faOther FragAmount) error {
	return fa.AddGamma(faOther, 1.0)
}

func (fa FragAmount) AddByFragType(fragType string, amount float64) error {
	if amount < 0 {
		return fmt.Errorf("bad freq")
	}
	if index, ok := FragRatioDataMap[fragType]; !ok {
		return fmt.Errorf("bad fragType")
	} else {
		fa.Data[index] += amount
		return nil
	}
}

func (fr FragRatio) Repr() (outStr string) {
	outStr += "["
	for i, v := range fr.Data {
		if i > 0 {
			outStr += ", "
		}
		outStr += fmt.Sprintf("%4.1f%%", 100*v)
	}
	outStr += "]"
	return outStr
}

func (fa FragAmount) Repr() (outStr string) {
	outStr += fa.NodeName
	outStr += ": ["
	for i, v := range fa.Data {
		if i > 0 {
			outStr += ", "
		}
		outStr += fmt.Sprintf("%6.1f", v)
	}
	outStr += "]"
	return outStr
}

func NodeGpuFragRatio(nodeRes simontype.NodeResource, typicalPods simontype.TargetPodList) FragRatio {
	data := make([]float64, len(FragRatioDataMap))
	fragRatio := FragRatio{data}
	for _, pod := range typicalPods {
		freq := pod.Percentage
		if freq < 0 || freq > 1 {
			log.Errorf("pod %v has bad freq: %f\n", pod.TargetPodResource, freq)
			continue
		}
		fragType := GetNodePodFrag(nodeRes, pod.TargetPodResource)
		log.Debugf("nodeRes: %s; pod: %s => fragType: %s (freq: %.2f)\n", nodeRes.Repr(), pod.TargetPodResource.Repr(), fragType, freq)
		if err := fragRatio.AddRatio(fragType, freq); err != nil {
			log.Errorln(err.Error())
		}
	}
	return fragRatio
}

// NodeGpuFragAmount is deprecated. Use NodeGpuShareFragAmount instead.
func NodeGpuFragAmount(nodeRes simontype.NodeResource, typicalPods simontype.TargetPodList) FragAmount {
	fragRatio := NodeGpuFragRatio(nodeRes, typicalPods)
	return GetFragAmountByNodeResAndFragRatio(nodeRes, fragRatio)
}

func NodeGpuShareFragAmount(nodeRes simontype.NodeResource, typicalPods simontype.TargetPodList) FragAmount {
	data := make([]float64, len(FragRatioDataMap))
	fragAmount := NewFragAmount(nodeRes.NodeName, data)
	for _, pod := range typicalPods {
		freq := pod.Percentage
		if freq < 0 || freq > 1 {
			log.Errorf("pod %v has bad freq: %f\n", pod.TargetPodResource, freq)
			continue
		}
		fragType := GetNodePodFrag(nodeRes, pod.TargetPodResource)
		gpuMilliLeftTotal := GetGpuMilliLeftTotal(nodeRes)
		if fragType == Q3Satisfied { // Part of GPUs are treated as Lack GPU fragment
			gpuFragMilli := GetGpuFragMilliByNodeResAndPodRes(nodeRes, pod.TargetPodResource)
			fragAmount.AddByFragType(Q2LackGpu, freq*float64(gpuFragMilli))
			fragAmount.AddByFragType(Q3Satisfied, freq*float64(gpuMilliLeftTotal-gpuFragMilli))
		} else { // Q1, Q2, XL, XR, NA => all idle GPU resources are treated as fragment
			fragAmount.AddByFragType(fragType, freq*float64(gpuMilliLeftTotal))
		}
	}
	return fragAmount
}

func NodeGpuFragBasedOnSkyline(nodeRes simontype.NodeResource, skylinePods simontype.SkylinePodList) int64 {
	gpuMilliLeftTotal := GetGpuMilliLeftTotal(nodeRes)
	for _, podRes := range skylinePods {
		if nodeRes.MilliCpuLeft >= podRes.MilliCpu && CanNodeHostPodOnGpuMemory(nodeRes, podRes) {
			return 0
		}
	}
	return gpuMilliLeftTotal
}

func NodeGpuShareFragAmountScore(nodeRes simontype.NodeResource, typicalPods simontype.TargetPodList) float64 {
	fragAmount := NodeGpuShareFragAmount(nodeRes, typicalPods)
	return fragAmount.FragAmountSumExceptQ3()
}

func GetGpuFragMilliByNodeResAndPodRes(nodeRes simontype.NodeResource, podRes simontype.PodResource) int64 {
	gpuFragMilli := int64(0)
	for _, milliGpuLeft := range nodeRes.MilliGpuLeftList {
		if milliGpuLeft < podRes.MilliGpu {
			gpuFragMilli += milliGpuLeft
		}
	}
	return gpuFragMilli
}

func GetFragAmountByNodeResAndFragRatio(nodeRes simontype.NodeResource, fragRatio FragRatio) FragAmount {
	fragAmount := NewFragAmount(nodeRes.NodeName, fragRatio.Data)
	gpuMilliLeftTotal := GetGpuMilliLeftTotal(nodeRes)
	for i := 0; i < len(fragAmount.Data); i++ {
		fragAmount.Data[i] *= float64(gpuMilliLeftTotal)
	}
	return fragAmount
}

func GetGpuMilliLeftTotal(nodeRes simontype.NodeResource) (gpuMilliLeftTotal int64) {
	for _, gpuMilliLeft := range nodeRes.MilliGpuLeftList {
		gpuMilliLeftTotal += gpuMilliLeft
	}
	return gpuMilliLeftTotal
}

/*
func NodeGpuFragBellmanEarlyStop(nodeRes simontype.NodeResource, typicalPods simontype.TargetPodList, dp *sync.Map) float64 {
	log.Tracef("Enter bellman with nodeRes(%s)\n", nodeRes.Repr())
	nodeResKey := nodeRes.Flatten()
	if fa, ok := dp.Load(nodeResKey); ok {
		if frag, ok2 := fa.(float64); ok2 {
			log.Tracef("Hit Cache! %v\n", nodeResKey)
			return frag
		}
	}

	var frag float64
	gpuMilliLeftTotal := float64(GetGpuMilliLeftTotal(nodeRes))
	if gpuMilliLeftTotal == 0 {
		return frag
	}

	gamma := 0.9 // gamma in (0, 1]
	delta := 1e-6
	fragRatio := NodeGpuFragRatio(nodeRes, typicalPods)
	fragRatioValue := fragRatio.FragRatioSumExceptQ3()
	if fragRatioValue < delta {
		log.Tracef("Zero frag ratio: %.2f\n", fragRatio.FragRatioSumExceptQ3())
		var pvSum float64 // init of pvSum = 0
		for _, pod := range typicalPods {
			p := pod.Percentage
			newNodeRes, err := nodeRes.Sub(pod.TargetPodResource)
			if err != nil { // r(s)
				log.Tracef("nodeRes.Sub(podRes) stops in Bellman: " + err.Error())
				v := gpuMilliLeftTotal
				log.Tracef("pvSum: %.2f + %.2f * p(%.2f) => %.2f\n", pvSum, v, p, pvSum+v*p)
				pvSum += v * p
				continue
			}
			log.Tracef(" pod(%s) calls Bellman\n", pod.TargetPodResource.Repr())
			v := NodeGpuFragBellmanEarlyStop(newNodeRes, typicalPods, dp)
			log.Tracef("pvSum: %.2f + %.2f * p(%.2f) => %.2f\n", pvSum, v, p, pvSum+v*p)
			pvSum += v * p
		}
		log.Tracef("Gamma: %.2f + %.2f * g(%.2f) => %.2f\n", frag, pvSum, gamma, frag+pvSum*gamma)
		frag += pvSum * gamma
	} else {
		log.Tracef("Got non-zero frag ratio: %s\n", fragRatio.Repr())
		// else: early cut-off: V(s) = r(s) (if r(s) > 0.001)
		frag = gpuMilliLeftTotal
	}
	dp.Store(nodeResKey, frag)
	log.Infof("dp: Update key(%v) as %.2f\n", nodeResKey, frag)
	return frag
}
*/

func NodeGpuFragBellman(nodeRes simontype.NodeResource, typicalPods simontype.TargetPodList, dp *sync.Map, cumProb float64) float64 {
	log.Tracef("Enter bellman with nodeRes(%s)\n", nodeRes.Repr())
	nodeResKey := nodeRes.Flatten("bellman")
	if fa, ok := dp.Load(nodeResKey); ok {
		if frag, ok2 := fa.(float64); ok2 {
			log.Tracef("Hit Cache! %v\n", nodeResKey)
			return frag
		}
	}

	var frag float64
	gpuMilliLeftTotal := float64(GetGpuMilliLeftTotal(nodeRes))
	if gpuMilliLeftTotal == 0 {
		//log.Infof("  skip: %s because gpuMilliLeftTotal(%f) == 0\n", nodeRes.Repr(), gpuMilliLeftTotal)
		return frag
	}
	if gpuMilliLeftTotal*cumProb < 1 {
		//log.Infof("  skip: %s because gpuMilliLeftTotal(%f) * cumProb(%f) < 1\n", nodeRes.Repr(), gpuMilliLeftTotal, cumProb)
		return 0
	}

	gamma := 1.0 // gamma in (0, 1]
	delta := 0.999
	fragRatio := NodeGpuFragRatio(nodeRes, typicalPods)
	fragRatioValue := fragRatio.FragRatioSumExceptQ3()
	if fragRatioValue < delta {
		log.Tracef("Non-full frag ratio: %.2f\n", fragRatio.FragRatioSumExceptQ3())
		var pvSum float64 // init of pvSum = 0
		for _, pod := range typicalPods {
			p := pod.Percentage
			newNodeRes, err := nodeRes.Sub(pod.TargetPodResource)
			if err != nil { // r(s)
				log.Tracef("nodeRes.Sub(podRes) stops in Bellman: " + err.Error())
				log.Tracef("pvSum: %.2f + %.2f * p(%.2f)\n", pvSum, gpuMilliLeftTotal, p)
				pvSum += gpuMilliLeftTotal * p
				continue
			}
			log.Tracef(" pod(%s) calls Bellman\n", pod.TargetPodResource.Repr())
			v := NodeGpuFragBellman(newNodeRes, typicalPods, dp, cumProb*p)
			log.Tracef("pvSum: %.2f + %.2f * p(%.2f) => %.2f\n", pvSum, v, p, pvSum+v*p)
			pvSum += v * p
		}
		log.Tracef("Gamma: %.2f + %.2f * g(%.2f) => %.2f\n", frag, pvSum, gamma, frag+pvSum*gamma)
		frag += pvSum * gamma
	} else {
		log.Tracef("Got full frag ratio: %s\n", fragRatio.Repr())
		// else: early cut-off: V(s) = r(s) (if r(s) > 0.001)
		frag = gpuMilliLeftTotal
	}
	dp.Store(nodeResKey, frag)
	//log.Infof("dp: Update key(%v) as %.2f\n", nodeResKey, frag)
	return frag
}

/*
func NodeGpuFragAmountBellman(nodeRes simontype.NodeResource, typicalPods simontype.TargetPodList, dp *sync.Map) FragAmount {
	log.Traceln()
	log.Debugf("Enter bellman with nodeRes(%s)\n", nodeRes.Repr())
	// Read dp memo
	nodeResKey := nodeRes.Flatten()
	if fa, ok := dp.Load(nodeResKey); ok {
		if fragAmount, ok2 := fa.(FragAmount); ok2 {
			log.Infof("Hit Cache! %v\n", nodeResKey)
			return NewFragAmount(nodeRes.NodeName, fragAmount.Data)
		}
	}

	fragAmount := FragAmount{nodeRes.NodeName, make([]float64, len(FragRatioDataMap))} // r(s) init as all zero
	if GetGpuMilliLeftTotal(nodeRes) == 0 {
		return fragAmount // If there are no GPUs left, the frag amount should be all zero
	}

	gamma := 1.0 // gamma in (0, 1]
	delta := 0.999
	// If missed, calculate and update dp memo
	fragRatio := NodeGpuFragRatio(nodeRes, typicalPods)
	if fragRatio.FragRatioSumExceptQ3() < delta {
		log.Infof("Non-full frag ratio: %.2f\n", fragRatio.FragRatioSumExceptQ3())
		// Bellman equation: V(s) = r(s) + gamma * sum( p(s'|s) * V(s') )
		pvSum := FragAmount{nodeRes.NodeName, make([]float64, len(FragRatioDataMap))} // init of pvSum = 0
		for i, pod := range typicalPods {
			p := pod.Percentage
			newNodeRes, err := nodeRes.Sub(pod.TargetPodResource)
			if err != nil { // r(s)
				log.Infof("nodeRes.Sub(podRes) stops in Bellman: " + err.Error())
				v := fragAmount
				log.Infof("pvSum (before): %s + %s (p=%.2f)\n", pvSum.Repr(), v.Repr(), p)
				if err := pvSum.AddGamma(v, p); err != nil {
					log.Errorf("pvSum.AddGamma errs in Bellman: " + err.Error())
				}
				log.Infof("pvSum (after) : %s\n", pvSum.Repr())
				continue
			}
			log.Infof(" pod[%d](%s) calls Bellman\n", i, pod.TargetPodResource.Repr())
			v := NodeGpuFragAmountBellman(newNodeRes, typicalPods, dp)
			log.Infof("pvSum (before): %s + %s (p=%.2f)\n", pvSum.Repr(), v.Repr(), p)
			if err = pvSum.AddGamma(v, p); err != nil { // sum( p(s'|s) * V(s') )
				log.Errorf("pvSum.AddGamma errs in Bellman: " + err.Error())
			}
			log.Infof("pvSum (after) : %s\n", pvSum.Repr())
		}

		log.Infof("gamma (before): %s + %s (gamma=%.2f)\n", fragAmount.Repr(), pvSum.Repr(), gamma)
		if err := fragAmount.AddGamma(pvSum, gamma); err != nil { // V(s) = r(s) + gamma * sum()
			log.Errorf("pvSum.AddGamma errs in Bellman: " + err.Error())
		}
		log.Infof("gamma (after) : %s\n", fragAmount.Repr())

	} else { // i.e., no pod could be allocated on this.
		log.Infof("Got full frag ratio: %s\n", fragRatio.Repr())
		// else: early cut-off: V(s) = r(s) (if r(s) > 0.001)
		fragAmount = GetFragAmountByNodeResAndFragRatio(nodeRes, fragRatio)
	}
	dp.Store(nodeResKey, NewFragAmount("", fragAmount.Data))
	log.Debugf("dp: Update key(%v) as %s\n", nodeResKey, NewFragAmount("", fragAmount.Data).Repr())
	return fragAmount
}
*/

func GetTypicalPods(allPods []*v1.Pod, config v1alpha1.TypicalPodsConfig) simontype.TargetPodList {
	tgtPodResCntMap := map[simontype.PodResource]float64{}
	podGpuCntMap := map[string]int64{}
	for _, v := range GpuNumTypeList {
		podGpuCntMap[v] = 0
	}
	var total float64 = 0
	for _, pod := range allPods {
		tgtPodRes := GetPodResource(pod)
		if !config.IsInvolvedCpuPods && tgtPodRes.GpuNumber == 0 {
			continue
		}

		var weightedCnt float64 = 1
		if config.GpuResWeight > 0 {
			if tgtPodRes.MilliGpu == gpushareutils.MILLI {
				weightedCnt = 1 + float64(tgtPodRes.GpuNumber)*config.GpuResWeight
			}
		}
		if cnt, ok := tgtPodResCntMap[tgtPodRes]; ok {
			tgtPodResCntMap[tgtPodRes] = cnt + weightedCnt
		} else {
			tgtPodResCntMap[tgtPodRes] = weightedCnt
		}
		total += weightedCnt

		switch tgtPodRes.GpuNumber {
		case 0:
			podGpuCntMap[GpuNumTypeList[0]] += 1 // CPU
		case 1:
			if tgtPodRes.MilliGpu < gpushareutils.MILLI {
				podGpuCntMap[GpuNumTypeList[1]] += 1 // ShareGpu
			} else {
				podGpuCntMap[GpuNumTypeList[2]] += 1 // OneGpu
			}
		case 2:
			podGpuCntMap[GpuNumTypeList[3]] += 1 // TwoGpu
		case 4:
			podGpuCntMap[GpuNumTypeList[4]] += 1 // FourGpu
		case 8:
			podGpuCntMap[GpuNumTypeList[5]] += 1 // EightGpu
		default:
			podGpuCntMap[GpuNumTypeList[6]] += 1 // Others
		}
	}

	tgtPodList := SortTargetPodInDecreasingCount(tgtPodResCntMap)
	log.Infof("Num of Total Pods: %d\n", len(allPods))
	for _, k := range GpuNumTypeList { // iter List, instead of Map, to guarantee order
		log.Infof("  %s Pods: %d (%.2f%%)\n", k, podGpuCntMap[k], 100.0*float64(podGpuCntMap[k])/total)
	}
	log.Infof("Num of Total Pod Sepc: %d\n", len(tgtPodList))
	var expectedNumPods float64 = 0
	if config.PodPopularityThreshold > 0 {
		expectedNumPods = float64(config.PodPopularityThreshold) * total / 100.0
	} else {
		expectedNumPods = float64(simontype.DefaultTypicalPodPopularityThreshold) * total / 100.0
	}
	var i, podResNum int
	var cumNumPods float64 = 0
	for cumNumPods < expectedNumPods {
		if config.PodIncreaseStep > 0 {
			podResNum += config.PodIncreaseStep
		} else {
			podResNum += simontype.DefaultTypicalPodIncreaseStep
		}
		for i < podResNum && i < len(tgtPodList) {
			numPods := tgtPodList[i].Percentage
			cumNumPods += numPods
			tgtPodList[i].Percentage = tgtPodList[i].Percentage / total // normalized to 0.0-1.0 (100%)
			ratioPct := 100 * tgtPodList[i].Percentage
			cumRatioPct := 100 * cumNumPods / total
			log.Infof("[%d] %s: %.0f (%.2f%%, cumsum: %.2f%%)\n", i, tgtPodList[i].TargetPodResource.Repr(), numPods, ratioPct, cumRatioPct)
			i += 1
		}
	}

	log.Infof("Count top %d pod resource spec as typical ones, accounting for %.2f%% of all pods\n", i, 100.0*cumNumPods/total)
	log.Infoln()

	if i >= len(tgtPodList) {
		return tgtPodList
	} else {
		outPodList := tgtPodList[:i] // chopping at i-th pods
		// normalize Percentage to 0.0 - 1.0 after chopping i-th pods
		var cumRatioPct float64
		for j := 0; j < i; j++ {
			outPodList[j].Percentage /= cumNumPods / total
			cumRatioPct += outPodList[j].Percentage
		}
		if math.Abs(cumRatioPct-1) > 1e-3 {
			log.Errorf("Renormalization fails (%.4f != 1.0): %v\n", cumRatioPct, outPodList)
		}
		return outPodList
	}
}

func GetSkylinePods(allPods []*v1.Pod) (skylinePods simontype.SkylinePodList) {
	skylinePods = make([]simontype.PodResource, 0)
	podResList := make([]simontype.PodResource, 0)
	for _, p := range allPods {
		podRes := GetPodResource(p)
		podResList = append(podResList, podRes)
	}
	sort.SliceStable(podResList, func(i, j int) bool {
		if podResList[i].MilliCpu < podResList[j].MilliCpu {
			return true
		} else if podResList[i].MilliCpu == podResList[j].MilliCpu {
			return podResList[i].MilliGpu < podResList[j].MilliGpu
		} else {
			return false
		}
	})
	for _, p := range podResList {
		num := len(skylinePods)
		if num == 0 || (p.MilliCpu > skylinePods[num-1].MilliCpu && p.MilliGpu < skylinePods[num-1].MilliGpu) {
			skylinePods = append(skylinePods, p)
		}
	}
	log.Infof("Number of Skyline Pods: %d\n", len(skylinePods))
	for i, p := range skylinePods {
		log.Infof("[%d] %s\n", i, p.Repr())
	}
	return skylinePods
}

func (fa FragAmount) FragAmountSumExceptQ3() (out float64) {
	for i := 0; i < len(FragRatioDataMap); i++ {
		if i != FragRatioDataMap[Q3Satisfied] {
			out += fa.Data[i]
		}
	}
	return out
}

func (fa FragAmount) FragAmountSumQ1Q2Q4() (out float64) {
	out += fa.Data[FragRatioDataMap[Q1LackBoth]]
	out += fa.Data[FragRatioDataMap[Q2LackGpu]]
	out += fa.Data[FragRatioDataMap[Q4LackCpu]]
	return out
}

func (fr FragRatio) FragRatioSumExceptQ3() (out float64) {
	for i := 0; i < len(FragRatioDataMap); i++ {
		if i != FragRatioDataMap[Q3Satisfied] {
			out += fr.Data[i]
		}
	}
	return out
}

func SortTargetPodInDecreasingCount(tgtPodResMap map[simontype.PodResource]float64) simontype.TargetPodList {
	pl := make(simontype.TargetPodList, len(tgtPodResMap))
	i := 0
	for k, v := range tgtPodResMap {
		pl[i] = simontype.TargetPod{TargetPodResource: k, Percentage: v}
		i++
	}
	sort.Sort(sort.Reverse(pl))
	return pl
}

func CanNodeHostPodOnGpuMemory(nodeRes simontype.NodeResource, podRes simontype.PodResource) bool {
	gpuRequest := podRes.GpuNumber
	for _, gpuHostMem := range nodeRes.MilliGpuLeftList {
		if gpuHostMem >= podRes.MilliGpu {
			gpuRequest -= 1
			if gpuRequest <= 0 {
				return true
			}
		}
	}
	return false
}

func GetNodePodFrag(nodeRes simontype.NodeResource, podRes simontype.PodResource) string {
	if podRes.MilliGpu == 0 {
		if nodeRes.MilliCpuLeft >= podRes.MilliCpu {
			return XLSatisfied
		} else {
			return XRLackCPU
		}
	}

	if IsNodeAccessibleToPod(nodeRes, podRes) == false {
		return NoAccess
	}

	if CanNodeHostPodOnGpuMemory(nodeRes, podRes) {
		if nodeRes.MilliCpuLeft >= podRes.MilliCpu {
			return Q3Satisfied
		} else {
			return Q4LackCpu
		}
	} else {
		if nodeRes.MilliCpuLeft >= podRes.MilliCpu {
			return Q2LackGpu
		} else {
			return Q1LackBoth
		}
	}
}
