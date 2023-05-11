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
$ cat experiments/run_scripts/run_scripts_0511.sh | while read i; do printf "%q\n" "$i"; done | xargs --max-procs=16 -I CMD bash -c CMD
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