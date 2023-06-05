## Experiment Steps

### 0. Prerequisite: Compiled Binary Files in the `bin` Directory.

Make sure the binary file `simon` has been generated in the `bin` directory (see "🚧 Environment Setup" in [README](../README.md) for details)


### 1. Run Scripts Generation

```bash
# pwd: kubernetes-scheduler-simulator/experiments
$ python run_scripts/generate_run_scripts.py > run_scripts/run_scripts_0511.sh
```


### 2. Execute

`run_scripts_0511.sh` includes multiple executable commands that are executed sequentially by default.
You can adjust the `--max-procs` parameter in the following command to modify the number of parallel threads based on the CPU resources available on your machine.
It is recommended to configure the parallel thread pool size to **half the number of virtual CPUs available** (i.e., `# of vCPU / 2`).

```bash
# pwd: kubernetes-scheduler-simulator/experiments
$ cd ..
# pwd: kubernetes-scheduler-simulator
$ cat experiments/run_scripts/run_scripts_0511.sh | while read i; do printf "%q" "$i"; done | xargs --max-procs=16 -I CMD bash -c CMD
# "--max-procs=16" where 16 is the degree of PARALLEL suggested above
# bash run_scripts_0511.sh will run experiments sequentially

#  ..|''||   '|.   '|' '||''''|       '||    ||'  ..|''||   '|.   '|' |''||''| '||'  '||'      '||'          |     |''||''| '||''''|  '||''|.   
# .|'    ||   |'|   |   ||  .          |||  |||  .|'    ||   |'|   |     ||     ||    ||        ||          |||       ||     ||  .     ||   ||  
# ||      ||  | '|. |   ||''|          |'|..'||  ||      ||  | '|. |     ||     ||''''||        ||         |  ||      ||     ||''|     ||''|'   
# '|.     ||  |   |||   ||             | '|' ||  '|.     ||  |   |||     ||     ||    ||        ||        .''''|.     ||     ||        ||   |.  
#  ''|...|'  .|.   '|  .||.....|      .|. | .||.  ''|...|'  .|.   '|    .||.   .||.  .||.      .||.....| .|.  .||.   .||.   .||.....| .||.  '|'
```

To explain the bash script generated (e.g., `run_scripts_0511.sh`)
- Each experiment is conducted via [scripts/generate_config_and_run.py](../scripts/generate_config_and_run.py)
    - Firstly, the script generates two configuration yaml files in that folder, which are served as input to `bin/simon apply` (i.e., cluster-config and scheduler-config, see "🔥 Quickstart Example" in repo [README](../README.md)), 
    - Then, it execute the `bin/simon apply` command (confirmed by passing the `-e` parameter to the script)
    - The `bin/simon`, written in Golang, will schedule the tasks and produce a scheduling log file in the corresponding folder.
- Afterwards, [scripts/analysis.py](../scripts/analysis.py) is executed to parse logs and yields multiple `analysis_*` files in the folder

An example output from the experiment:

```bash
# log-cc_owdefault_dr0.0_tn1.3_ts42_if1.0_md7976.yaml-sc_FGD1000_deshare_gsFGDScore_mdaf9c.yaml.log:
========== Cluster Analysis Results (InitSchedule) ==========
Allocation Ratio:
    MilliCpu : 84.0% (89928302/107018000)
    Memory   : 62.3% (328998433325056/528302452244480)
    Gpu      : 99.6% (6189/6212)
    MilliGpu : 95.3% (5919410/6212000)
q1_lack_both : 138.43 x 10^3 (47.31%)
q2_lack_gpu  :  85.86 x 10^3 (29.35%)
q3_satisfied :   1.23 x 10^3 ( 0.42%)
q4_lack_cpu  :  27.28 x 10^3 ( 9.32%)
xl_satisfied :   6.06 x 10^3 ( 2.07%)
xr_lack_cpu  :  33.73 x 10^3 (11.53%)
no_access    :   0.00 x 10^3 ( 0.00%)
------------------
idle_gpu_milli: 292.59 x 10^3 (100.0%)
frag_gpu_milli: 291.36 x 10^3 (99.58%)
==============================================
```


In fact, it takes around
- 10 minutes for 1 experiment on 2 vCPU, 9.4MB disk space for logs.
- 10 hours for 1020 experiments on a 256 vCPU machine with pool size of 128 threads, 9.4GB disk space for logs.

> Our generated script for 1020 experiments is cached in [run_scripts/expected_run_scripts_0511.sh](./run_scripts/expected_run_scripts_0511.sh) (3063 lines) for your reference.


### 3. Analysis & Merge

As each experiment has its own folder where the `analysis_*` files are produced, here we bypass all folders and merge all the analysis files of the same category into one file under the `analysis/analysis_results` folder.

The top folder of the experiment varies with DATE (e.g., `2023_0511`), while the `analysis_merge.sh` is hard-coded to bypass and merge folders under the `data` folder. Therefore, we need to softlink the top folder to be merged to `data` (e.g., `$ ln -s 2023_0511 data`) before executing `$ bash analysis_merge.sh`.

```bash
# pwd: kubernetes-scheduler-simulator/experiments
$ ln -s 2023_0511 data # softlink it to data
# pwd: kubernetes-scheduler-simulator/experiments/analysis
$ cd analysis
# The output will be put under "analysis_results" folder
$ bash analysis_merge.sh
```

#### Structure of the 1020 Experiments and Results

Since we have 6 scheduling policies to evaluate (including baselines); for each policy, we have 17 traces (see `data`) where workloads have different distributions; for each policy-trace setting, we repeat the experiments 10 times to, as you pointed out, ensure the reliability of the results. Therefore, there are `6 x 17 x 10 = 1020` experiments to conduct.  These 1020 experiments have the following structure:

```bash
├── 01-Random
│   ├── dataset_01_default
│   │   ├── random_seed_01
│   │   ├── random_seed_02
│   │   ├── random_seed_..
│   │   └── random_seed_10
│   ├── dataset_02_fig11_1
│   ├── dataset_..
│   └── dataset_17_fig14_4
│
├── 02-DotProd
│   ├── dataset_..
│   │   ├── random_seed_..
│
├── 03-GpuClustering
│   ├── dataset_..
│   │   ├── random_seed_..
│
├── 04-GpuPacking
│   ├── dataset_..
│   │   ├── random_seed_..
│
├── 05-BestFit
│   ├── dataset_..
│   │   ├── random_seed_..
│
└── 06-FGD
    ├── dataset_..
    │   ├── random_seed_..
```

Nevertheless, the inner logic of the simulator is the same, regardless of the input traces and deployed scheduling policies. Instead of conducting all the experiments, it is recommended to **randomly pick any one of the experiments for execution** and compare its result with the files summarized in `analysis/expected_results`.

To better understand the result files, we take `analysis_allo_discrete.csv` as a example: The headers are the workload (traces), the scheduling policy, the workload inflation ratio (1.3 means 130% of cluster's GPU capacity), the random seed (42, 43, ..., 51), the total number of GPUs in the cluster, and a series of numbers from 0 to 130.

The 0-130 (`130 = tune (1.3) * 100`) represents the total GPU request (normalized by the `total_gpus`) of submitted arrived workloads; its corresponding values (e.g., 91.53 under column:130) is GPU allocation ratio in the cluster---which is the **key performance indicator (the higher the better)** shown in Fig. 9(a). The following selected results show that our policy 06-FGD outperforms 01-Random by 4% in allocation ratio given workloads with 130% GPU requests in `openb_pod_list_cpu050` traces.

| workload              | sc_policy | tune | seed | total_gpus | 0    | 1    | 2   | ... | 129   | 130       |
| --------------------- | --------- | ---- | ---- | ---------- | ---- | ---- | --- | --- | ----- | --------- |
| openb_pod_list_cpu050 | 01-Random | 1.3  | 42   | 6212       | 0.25 | 0.99 | 2.0 | ... | 91.51 | **91.53** |
| openb_pod_list_cpu050 | 06-FGD    | 1.3  | 42   | 6212       | 0.25 | 0.99 | 2.0 | ... | 95.34 | **95.34** |

The other result files show the fragmentation ratio (`analysis_frag_ratio_discrete.csv`, Fig 7(a)), fragmentation amount (`analysis_frag_discrete.csv`, Fig 7(b)), and distribution of failed pods (`analysis_fail.csv`, Fig 9(c)).

> Our results of the extensive 1020 experiments are cached in [analysis/expected_results](./analysis/expected_results/) (9.8MB) for your reference.


### 4. Plot

To reproduce the figures shown in the paper, we provide the plotting scripts in the [plot](./plot/) folder. As the scripts assume the existence of the merged `analysis_*.csv` files, we need to first copy (or softlink) these files to [plot](./plot/) folder

```bash
# pwd: kubernetes-scheduler-simulator/experiments/analysis
$ cd ..
# pwd: kubernetes-scheduler-simulator/experiments
$ cp analysis/analysis_results/* plot/ # copy all csv under analysis_results/ to plot/ for analysis
```

if you have skipped the extensive experiments and/or would like to use our expected analysis results for plotting, please replace the last command as:
```bash
$ cp analysis/expected_results/* plot/
```

As the final step, step into the [plot](./plot/) folder and generate figures (in pdf format) based on the analysis results. For example, running `python plot_openb_alloc.py` will produce `openb_alloc.pdf` in the current directory, which corresponds to Fig. 9(a) in the paper.

```bash
$ cd plot
$ python plot_openb_alloc.py              # Fig. 9(a)
$ python plot_openb_frag_amount.py        # Fig. 7(a)
$ python plot_openb_frag_ratio.py         # Fig. 7(b)
$ python plot_openb_gpushare_alloc_bar.py # Fig. 11
$ python plot_openb_multigpu_alloc_bar.py # Fig. 12
$ python plot_openb_gpuspec_alloc_bar.py  # Fig. 13
$ python plot_openb_nongpu_alloc_bar.py   # Fig. 14
```

> Our results shown in the paper are cached in [plot/expected_results](plot/expected_results) (164KB) for your reference.