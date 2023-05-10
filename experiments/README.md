## Steps

### Generate Run Scripts
```bash
cd kubernetes-scheduler-simulator/experiments
python run_scripts/generate_run_scripts.py > run_scripts/run_scripts_0511.sh
```

Script parameters:
- Date:
- FileList:
- PARALLEL: num vCPU / 2 (suggested)
- NUM_REPEAT: repetited experiments (10 in paper)

### Execute
```bash
# pwd: kubernetes-scheduler-simulator/experiments
cd ..
# pwd: kubernetes-scheduler-simulator
cat experiments/run_scripts/run_scripts_0511.sh | while read i; do printf "%q\n" "$i"; done | xargs --max-procs=16 -I CMD bash -c CMD
# "--max-procs=16" where 16 is the degree of PARALLEL suggested above
# bash run_scripts_0511.sh will run experiments sequentially
```

~~1 month later ...~~
- 1 hour for 1 experiment on 2 vCPU.
- 16 hours for 1020 experiments on a 256 vCPU machine with PARALLEL=128.

### Merge
```bash
# pwd: kubernetes-scheduler-simulator/experiments
ln -s 2023_0511 data # softlink it to data
cd analysis
bash merge_bash.sh
```

### Plot
```bash
# pwd: kubernetes-scheduler-simulator/experiments
ln -s analysis/analysis_results/* plot/ # softlink all csv under analysis_results/ to plot/
cd plot
python plot_paib_alloc.py              # Fig. 9(a)
python plot_paib_frag_amount.py        # Fig. 7(a)
python plot_paib_frag_ratio.py         # Fig. 7(b)
python plot_paib_gpushare_alloc_bar.py # Fig. 11
python plot_paib_multigpu_alloc_bar.py # Fig. 12
python plot_paib_gpuspec_alloc_bar.py  # Fig. 13
python plot_paib_nongpu_alloc_bar.py   # Fig. 14
```

