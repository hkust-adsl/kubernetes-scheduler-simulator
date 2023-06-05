# 🚀 Kubernetes Scheduler Simulator

The simulator evaluates different scheduling policies in GPU-sharing clusters.
It includes the Fragmentation Gradient Descent (FGD) policy proposed in the [USENIX ATC 2023](https://www.usenix.org/conference/atc23) paper "[Beware of Fragmentation: Scheduling GPU-Sharing Workloads with Fragmentation Gradient Descent](https://www.usenix.org/conference/atc23/presentation/weng)", along with other baseline policies (e.g., Best-fit, Dot-product, GPU Packing, GPU Clustering, Random-fit). 

## 🚧 Environment Setup

### Build from stratch

Please ensure that Go is installed.

`go mod vendor` installs the dependencies required for the simulator. 

```bash
$ go mod vendor
```

`make` generates the compiled binary files in the `bin` directory.

```bash
$ make
```

### Run within Docker

To save your time in the environment setup, we have just prepared a docker [image](https://hub.docker.com/r/qzweng/kubernetes-scheduler-simulator) with Golang 1.20.4, Python 3.10.11, and required libraries installed.

Besides, we have copied the GitHub repo under the home directory and compile the executable binary file (`bin/simon`), therefore, `go mod vendor` and `make` commands are no longer needed.

For the users not familiar with Docker, please refer to the official installation [guide](https://docs.docker.com/engine/install) on Linux, Mac, or Windows platform. For the others, the following commands are for your reference.

```bash
# step 1: pull image
sudo docker pull qzweng/kubernetes-scheduler-simulator:atc23

# step 2: launch the docker container
sudo docker run -d --name=kss qzweng/kubernetes-scheduler-simulator:atc23 bash -c "sleep infinity"

# step 3: execute commands inside the container
sudo docker exec -it kss bash

# step 4: go to the project folder and conduct experiments
cd ~/kubernetes-scheduler-simulator
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

Install the required Python dependency environment.

```bash
$ pip install -r requirements.txt
```

1. Please refer to [README](data/README.md) under the `data` directory to prepare production traces.
2. Then refer to [README](experiments/README.md) under the `experiments` directory to reproduce the results reported in the paper.

## 📝 Paper

Please cite our paper if it is helpful to your research.

```
@inproceedings{FGD2023,
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

## ⏳ TODO

- [ ] Add a minikube running example to demonstrate how the simulator schedules pods in a **real** Kubernetes cluster.
