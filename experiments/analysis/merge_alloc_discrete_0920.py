import pandas as pd
from pathlib import Path
from utils import move_tag_to_new_column
RESULTDIR="analysis_results"
DATADIR="data"
root = Path(__file__).parents[1] # 0524
data = root / DATADIR
analysis = Path(__file__).parent # 0830
resultDir = analysis / RESULTDIR
# .
# ├── README.md
# ├── [d] analysis
# │   ├── [d] analysis_results
# │   │   ├── analysis_new.csv
# │   │   └── analysis.csv
# │   ├── [d] images
# │   ├── merge_0913.py
# │   ├── plot_0810_dotprod_extend.py
# ├── [d] data
# │   ├── [d] cluster_hhpai_na61-pod_hhpai_na61-0820_no_time
# │   │   ├── [d] 01-FragShare
# │   │   │   ├── [d] 0.6
# │   │   │   │   ├── [d] 42
# ......

def exit_and_save_to_csv(dflist):
    dfo = pd.concat(dflist)
    resultDir.mkdir(exist_ok=True)
    csvfile = resultDir / 'analysis_allo_discrete.csv'
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
                afile = fdir / pdir / tdir / sdir / 'analysis_allo.csv'
                print(afile)
                if not afile.is_file():
                    continue
                try:
                    df = pd.read_csv(afile)
                    df.columns = [x.split('-')[-1] for x in df.columns]
                    dfd = df.to_dict(orient="list")

                    total_gpu_num = df.total_gpus.values[0]
                    df['arrive_ratio'] = df.arrived_gpu_milli / total_gpu_num / 10
                    df['arrive_ratio'] = df['arrive_ratio'].apply(lambda x: round(x, 0))
                    df['alloc_ratio'] = df.used_gpu_milli / total_gpu_num / 10
                    df['alloc_ratio'] = df['alloc_ratio'].apply(lambda x: round(x, 2))
                    


                    dfn = dict()
                    # for k, v in dfd.items():
                    #     dfn[k] = "-".join(str(x) for x in v)
                    dfn["workload"] = fdir.name
                    dfn["sc_policy"] = pdir.name
                    dfn['tune']= tdir.name
                    dfn['seed'] = sdir.name
                    dfn['total_gpus'] = total_gpu_num
                    for arrr in range(0, 131, 1):
                        dfv = df[df.arrive_ratio==arrr]
                        if len(dfv) == 0:
                            dfv = df[(df.arrive_ratio>=arrr-1)&(df.arrive_ratio<=arrr+1)]
                            if len(dfv) == 0:
                                # print("No data:", arrr)
                                continue
                        val = round(dfv.alloc_ratio.mean(), 2)
                        dfn[arrr] = val
                    
                    dfo = pd.DataFrame(dfn, index=[len(dflist)]).set_index(["workload", "sc_policy", "tune", "seed"])
                    dflist.append(dfo)

                    # if len(dflist) > 1:
                    #     exit_and_save_to_csv(dflist)

                except Exception as e:
                    exit("ERROR file: %s\n%s" % (afile, e))

exit_and_save_to_csv(dflist)