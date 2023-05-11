import os
import pandas as pd
from pathlib import Path

IN_FILE="analysis_fail.out"
OUT_CSV="analysis_fail.csv"
RESULTDIR="analysis_results"
DATADIR="data"

filepath = os.path.abspath(__file__)
root = Path(filepath).parents[1] # 0524
data = root / DATADIR
analysis = Path(filepath).parent # 0830
resultDir = analysis / RESULTDIR
# .
# ├── README.md
# ├── [d] analysis
# │   ├── [d] analysis_results
# │   │   ├── analysis_new.csv
# │   │   └── analysis.csv
# │   ├── [d] images
# │   ├── merge.py
# │   ├── plot.py
# ├── [d] data
# │   ├── [d] openb_pod_list_default
# │   │   ├── [d] 06-FGD
# │   │   │   ├── [d] 1.3
# │   │   │   │   ├── [d] 42
# ......

def get_total_num_gpu(workload):
    return 6212

def parse_fail_out_file_to_df(ifile):
    with open(ifile, 'r') as f:
        start_signal = 0
        out_list = []
        for line in f.readlines():
            beef = ""
            if line.startswith('log-'):
                start_signal = 1
                continue
            elif line.startswith('Failed No'):
                break
            elif start_signal == 1:
                beef = line.strip()
            else:
                continue

            num_pod, request = beef.split(';')
            num_pod = int(num_pod)
            cpu_q, gpu_q = request.split(', ')
            cpu_m = int(float(cpu_q.split(':')[1].strip()) * 1000)
            gpu_n = int(gpu_q.split(':')[1].split('x')[0].strip())
            gpu_m = int(gpu_q.split(':')[1].split('x {')[1].split('}m')[0].strip())
            gpu_t = gpu_q.split(':')[1].split('m (')[1].split(')>')[0].strip()
            gpu_t = "<none>" if len(gpu_t) == 0 else gpu_t
            result = [num_pod, cpu_m, gpu_n, gpu_m, gpu_t]
            out_list.append(result.copy())
    
        df = pd.DataFrame(out_list)
        if len(df) != 0:  # has failed pods
            df.columns = ['num_pod', 'cpu_milli', 'num_gpu', 'gpu_milli', 'gpu_type_req']
    return df

def exit_and_save_to_csv(dflist):
    dfo = pd.concat(dflist)
    resultDir.mkdir(exist_ok=True)
    csvfile = resultDir / OUT_CSV
    dfo.to_csv(csvfile)
    print("%d rows saved to: %s" % (len(dfo), csvfile))
    exit()

fileDirs = sorted([x for x in data.iterdir() if x.is_dir()])
dflist = []
for fdir in fileDirs:
    policyDirs = sorted([x for x in fdir.iterdir() if x.is_dir()])
    for pdir in policyDirs:            
        tuneDirs = sorted([x for x in pdir.iterdir() if x.is_dir()])
        for tdir in tuneDirs:
            seedDirs = sorted([x for x in tdir.iterdir() if x.is_dir()])
            for sdir in seedDirs:
                ifile = fdir / pdir / tdir / sdir / IN_FILE
                print(ifile)
                if not ifile.is_file():
                    continue
                try:
                    dff = parse_fail_out_file_to_df(ifile)
                    fail_pod_cols = list(dff.columns)
                    dff["workload"] = fdir.name
                    dff["sc_policy"] = pdir.name
                    dff['tune']= tdir.name
                    dff['seed'] = sdir.name
                    dff.index.names = ['order']
                    meta_cols = ['workload', 'sc_policy', 'tune', 'seed']
                    dff = dff[meta_cols + fail_pod_cols]
                    dflist.append(dff)

                    # if len(dflist) > 1:
                    #     exit_and_save_to_csv(dflist)

                except Exception as e:
                    exit("ERROR file: %s\n%s" % (ifile, e))

exit_and_save_to_csv(dflist)