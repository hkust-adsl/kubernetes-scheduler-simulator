# Command-line Options of Auxiliary Python scripts

Since Kubernetes-scheduler-simulator borrows the structure from [open-simulator](https://github.com/alibaba/open-simulator), there are quite a few configurations that can be tuned in a real cluster. Despite that `bin/simon` is capable of standing-alone execution, as demostrated in "Quick Start Example", we still wrap the `bin/simon` with these Python scripts, for the convenience in conducting large-scale experiments. Let me explain these options.

## [`generate_config_and_run.py`](./generate_config_and_run.py)

```bash
python3 scripts/generate_config_and_run.py \
  -d "${EXPDIR}" -e -b \
  -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share \
  -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z \
  "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && \
```

- `-d`: the experiment dir that host the generated yaml files for input (i.e., the cluster-config and scheduler-config files in "Quick Start Example") and output files (log, csv)
- `-e`: set to execute the command (if not set, the script will print the generated command to stdout rather than executing it. c.f. L#381)
- `-b`: blocking execution forces the python scripts to wait until the /bin/simon finishes
- `-f`: path to YAML file containing origin cluster node and pod list
- `-FGD 1000`: set the score weight of policy FGD to 1000. Other alternatives include "Random", "DotProd", "GpuClustering", "GpuPacking", "BestFit". Although Kubernetes supports multiple scheduling policies to score together, each having its own score weights, here we evaluate the policy on their own.
  - `-gpusel FGD`: parameter in scheduling policy: GPU selection method
  - `-dimext share`: parameter in scheduling policy: dimension extension method
  - `-norm max`: parameter in scheduling policy: normalization method
- `-tune 1.3`: tuning the workload (either inflate (>1) or shrink (<1)) to match the cluster's GPU capacity. 1.3 means the total GPU request of submitted arrived workloads reaches 130% of cluster's GPU capacity
- `-tuneseed 42`: random seed. If we inflate the workloads, we sample workloads repeated from the original trace using this seed.
- `--shuffle-pod=true`: whether to shuffle the pods' order or not (i.e., respect their original order of submission).   
- `-z snapshot_dir`: directory to save the final state of the cluster in yaml files. This parameter would not affect the results.

## [`analysis.py`](./analysis.py)

```bash
python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out"
```

- `analysis.py` is to process the output log file of `bin/simon` after execution.
- `-f`: whether to export the failed pods
- `-g`: whether to parse the output log file with `grep` and output a concise output, e.g., 

```bash
===
# log-cc_owdefault_dr0.0_tn1.3_ts42_if1.0_md7976.yaml-sc_FGD1000_deshare_gsFGDScore_mdaf9c.yaml.log:
time="2023-05-09T21:12:45+08:00" level=info msg="========== Cluster Analysis Results (InitSchedule) =========="
time="2023-05-09T21:12:45+08:00" level=info msg="Allocation Ratio:\n"
time="2023-05-09T21:12:45+08:00" level=info msg="    MilliCpuLeft: 84.0% (89928302/107018000)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="    Memory  : 62.3% (328998433325056/528302452244480)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="    Gpu     : 99.6% (6189/6212)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="    MilliGpu: 95.3% (5919410/6212000)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="q1_lack_both : 138.43 x 10^3 (47.31%)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="q2_lack_gpu  :  85.86 x 10^3 (29.35%)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="q3_satisfied :   1.23 x 10^3 ( 0.42%)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="q4_lack_cpu  :  27.28 x 10^3 ( 9.32%)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="xl_satisfied :   6.06 x 10^3 ( 2.07%)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="xr_lack_cpu  :  33.73 x 10^3 (11.53%)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="no_access    :   0.00 x 10^3 ( 0.00%)\n"
time="2023-05-09T21:12:45+08:00" level=info msg=--------------------
time="2023-05-09T21:12:45+08:00" level=info msg="idle_gpu_milli: 292.59 x 10^3 (100.0%)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="frag_gpu_milli: 291.36 x 10^3 (99.58%)\n"
time="2023-05-09T21:12:45+08:00" level=info msg="=============================================="
```
