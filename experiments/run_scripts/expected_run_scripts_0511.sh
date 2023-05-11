#!/bin/bash
# cat run_scripts_0511.sh | while read i; do printf "%q\n" "$i"; done | xargs --max-procs=16 -I CMD bash -c CMD

# 01, Random, random, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/01-Random/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -Random 1000 -gpusel random -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/02-DotProd/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/03-GpuClustering/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuClustering 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/04-GpuPacking/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuPacking 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/05-BestFit/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -BestFit 1000 -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/06-FGD/1.3/42" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 42 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/01-Random/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -Random 1000 -gpusel random -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/02-DotProd/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/03-GpuClustering/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuClustering 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/04-GpuPacking/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuPacking 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/05-BestFit/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -BestFit 1000 -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/06-FGD/1.3/43" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 43 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/01-Random/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -Random 1000 -gpusel random -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/02-DotProd/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/03-GpuClustering/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuClustering 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/04-GpuPacking/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuPacking 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/05-BestFit/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -BestFit 1000 -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/06-FGD/1.3/44" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 44 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/01-Random/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -Random 1000 -gpusel random -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/02-DotProd/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/03-GpuClustering/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuClustering 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/04-GpuPacking/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuPacking 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/05-BestFit/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -BestFit 1000 -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/06-FGD/1.3/45" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 45 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/01-Random/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -Random 1000 -gpusel random -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/02-DotProd/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/03-GpuClustering/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuClustering 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/04-GpuPacking/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuPacking 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/05-BestFit/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -BestFit 1000 -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/06-FGD/1.3/46" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 46 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/01-Random/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -Random 1000 -gpusel random -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/02-DotProd/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/03-GpuClustering/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuClustering 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/04-GpuPacking/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuPacking 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/05-BestFit/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -BestFit 1000 -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/06-FGD/1.3/47" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 47 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/01-Random/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -Random 1000 -gpusel random -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/02-DotProd/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/03-GpuClustering/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuClustering 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/04-GpuPacking/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuPacking 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/05-BestFit/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -BestFit 1000 -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/06-FGD/1.3/48" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 48 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/01-Random/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -Random 1000 -gpusel random -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/02-DotProd/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/03-GpuClustering/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuClustering 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/04-GpuPacking/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuPacking 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/05-BestFit/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -BestFit 1000 -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/06-FGD/1.3/49" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 49 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/01-Random/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -Random 1000 -gpusel random -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/02-DotProd/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/03-GpuClustering/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuClustering 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/04-GpuPacking/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuPacking 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/05-BestFit/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -BestFit 1000 -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/06-FGD/1.3/50" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 50 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_default
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_default -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu050
EXPDIR="experiments/2023_0511/openb_pod_list_cpu050/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu050 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu100
EXPDIR="experiments/2023_0511/openb_pod_list_cpu100/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu200
EXPDIR="experiments/2023_0511/openb_pod_list_cpu200/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu200 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_cpu250
EXPDIR="experiments/2023_0511/openb_pod_list_cpu250/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_cpu250 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare100
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare100/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare100 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare40
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare40/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare60
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare60/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare60 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpushare80
EXPDIR="experiments/2023_0511/openb_pod_list_gpushare80/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpushare80 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec10
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec10/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec10 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec20
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec20/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec25
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec25/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec25 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_gpuspec33
EXPDIR="experiments/2023_0511/openb_pod_list_gpuspec33/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_gpuspec33 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu20
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu20/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu20 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu30
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu30/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu30 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu40
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu40/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu40 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 01, Random, random, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/01-Random/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -Random 1000 -gpusel random -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 02, DotProd, best, merge, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/02-DotProd/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -DotProd 1000 -gpusel best -dimext merge -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 03, GpuClustering, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/03-GpuClustering/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuClustering 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 04, GpuPacking, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/04-GpuPacking/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -GpuPacking 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 05, BestFit, <none>, <none>, <none> @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/05-BestFit/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -BestFit 1000 -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

# 06, FGD, FGD, share, max @ openb_pod_list_multigpu50
EXPDIR="experiments/2023_0511/openb_pod_list_multigpu50/06-FGD/1.3/51" && mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out" && python3 scripts/generate_config_and_run.py -d "${EXPDIR}" -e -b -f data/openb_pod_list_multigpu50 -FGD 1000 -gpusel FGD -dimext share -norm max -tune 1.3 -tuneseed 51 --shuffle-pod=true -z "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" && python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out" 

