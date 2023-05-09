## Environment Setup

Please ensure that Go is installed. `go mod vendor` will install the dependencies required for the simulator, and `make` will generate the compiled binary fils in the `bin` directory.

```bash
$ go mod vendor
$ make local_build
$ make linux_build
```

## QuickStart Example

```bash
$  LOGLEVEL=DEBUG bin/simon apply --extended-resources "gpu" -s example/test-scheduler-config.yaml -f example/test-cluster-config.yaml
```

## Acknowledge

Our simulator is developed based on [Alibaba's open-simulator](https://github.com/alibaba/open-simulator), a simulator used for cluster capacity planning. 
The GPU-related plugin has been incorporated into its main branch.