## Experiment Steps

### Prerequisite: Compiled Binary Files in the `bin` Directory.

Make sure the binary file `simon` has been generated in the `bin` directory (see "🚧 Environment Setup" in [README](../README.md) for details)

### Generate Run Scripts

```bash
# pwd: kubernetes-scheduler-simulator/experiments
$ python run_scripts/generate_run_scripts.py > run_scripts/run_scripts_0511.sh
```

### Execute

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

#  ..|''||   '|.   '|' '||''''|     '||    ||'  ..|''||   '|.   '|' |''||''| '||'  '||'    '||'          |     |''||''| '||''''|  '||''|.   
# .|'    ||   |'|   |   ||  .        |||  |||  .|'    ||   |'|   |     ||     ||    ||      ||          |||       ||     ||  .     ||   ||  
# ||      ||  | '|. |   ||''|        |'|..'||  ||      ||  | '|. |     ||     ||''''||      ||         |  ||      ||     ||''|     ||''|'   
# '|.     ||  |   |||   ||           | '|' ||  '|.     ||  |   |||     ||     ||    ||      ||        .''''|.     ||     ||        ||   |.  
#  ''|...|'  .|.   '|  .||.....|    .|. | .||.  ''|...|'  .|.   '|    .||.   .||.  .||.    .||.....| .|.  .||.   .||.   .||.....| .||.  '|'
```

Roughly, it takes around
- 10 minutes for 1 experiment on 2 vCPU.
- 10 hours for 1020 experiments on a 256 vCPU machine with pool size of 128 threads.

### Merge

```bash
# pwd: kubernetes-scheduler-simulator/experiments
$ ln -s 2023_0511 data # softlink it to data
# pwd: kubernetes-scheduler-simulator/experiments/analysis
$ cd analysis
$ bash bash_merge.sh
# The output was generated under "analysis_results"
# The results of our large-scale experiments are cached in "expected_results" for comparison
```

### Plot

Automatically generate figures in the paper based on the analysis results and compare them with the results in the [expected_results](plot/expected_results) directory.
For example, running `python plot_paib_alloc.py` will generate `paib_alloc.pdf` figure, which corresponds to Fig. 9(a) in the paper.

```bash
# pwd: kubernetes-scheduler-simulator/experiments/analysis
$ cd ..
# pwd: kubernetes-scheduler-simulator/experiments
$ cp analysis/analysis_results/* plot/ # copy all csv under analysis_results/ to plot/ for analysis
# cp analysis/expected_results/* plot/ # if skipping the experiments and directly reuse our expected results for plotting
$ cd plot
$ python plot_paib_alloc.py              # Fig. 9(a)
$ python plot_paib_frag_amount.py        # Fig. 7(a)
$ python plot_paib_frag_ratio.py         # Fig. 7(b)
$ python plot_paib_gpushare_alloc_bar.py # Fig. 11
$ python plot_paib_multigpu_alloc_bar.py # Fig. 12
$ python plot_paib_gpuspec_alloc_bar.py  # Fig. 13
$ python plot_paib_nongpu_alloc_bar.py   # Fig. 14
```