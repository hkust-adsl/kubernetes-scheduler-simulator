# 🚀 Kubernetes Scheduler Simulator

The simulator evaluates different scheduling policies in GPU-sharing clusters.
It includes the Fragmentation Gradient Descent (FGD) policy proposed in the ATC paper (Beware of Fragmentation: Scheduling GPU-Sharing Workloads with Fragmentation Gradient Descent), along with other baseline policies. 

## 🚧 Environment Setup

Please ensure that Go is installed.

`go mod vendor` installs the dependencies required for the simulator. 

```bash
$ go mod vendor
```

`make` generates the compiled binary files in the `bin` directory.

```bash
$ make
```

## 🔥 Quickstart Example

The following example will schedule 6 pods to a cluster with 2 nodes, and the expected output will show the allocation ratio of each resource dimension (CPU, memory, GPU).
The default scheduling policy is fragmentation gradient descent (FGD).

```bash
$ bin/simon apply --extended-resources "gpu" \
                  -f example/test-cluster-config.yaml \
                  -s example/test-scheduler-config.yaml
```

## 🔮 Experiments on Production Traces

Please refer to [README](data/README.md) under the `data` directory to prepare production traces, and then refer to [README](experiments/README.md) under the `experiments` directory to reproduce the results reported in the paper.

## 📝 Paper

Please cite our paper if it is helpful to your research.

```
@inproceedings{FGD,
    title = {Beware of Fragmentation: Scheduling GPU-Sharing Workloads with Fragmentation Gradient Descent},
    author = {Qizhen Weng and Lingyun Yang and Yinghao Yu and Wei Wang and Xiaochuan Tang and Guodong Yang and Liping Zhang},
    booktitle = {2023 {USENIX} Annual Technical Conference},
    year = {2023},
    series = {{USENIX} {ATC} '23}
    url = {https://www.usenix.org/conference/atc23/presentation/weng},
    publisher = {{USENIX} Association},
}
```

## 🙏🏻 Acknowledge

Our simulator is developed based on [open-simulator](https://github.com/alibaba/open-simulator) by Alibaba, a simulator used for cluster capacity planning. 
This repository primarily evaluates the performance of different scheduling polices on production traces.
GPU-related plugin has been merged into the main branch of [open-simulator](https://github.com/alibaba/open-simulator).