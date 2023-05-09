import pandas as pd
from pathlib import Path
from utils import get_total_num_gpu

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
    csvfile = resultDir / 'analysis_frag_ratio_discrete.csv'
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
                ffile = fdir / pdir / tdir / sdir / 'analysis_frag.csv'
                print(afile)
                if not afile.is_file():
                    continue
                try:
                    dfa = pd.read_csv(afile)
                    dfa.columns = [x.split('-')[-1] for x in dfa.columns]
                    # [used_nodes, used_gpus, used_gpu_milli, total_gpus, arrived_gpu_milli]

                    total_gpu_num = dfa.total_gpus.values[0]
                    dfa['arrive_ratio'] = dfa.arrived_gpu_milli / total_gpu_num / 10
                    dfa['arrive_ratio'] = dfa['arrive_ratio'].apply(lambda x: round(x, 0))
                    dfa['alloc_ratio'] = dfa.used_gpu_milli / total_gpu_num / 10
                    dfa['alloc_ratio'] = dfa['alloc_ratio'].apply(lambda x: round(x, 2))
                    
                    dff = pd.read_csv(ffile)
                    dff.columns = [x.split('-')[-1] for x in dff.columns]
                    # [origin_milli, origin_ratio, origin_q124, bellman_milli, bellman_ratio]

                    df = dfa.join(dff)

                    dfn = dict()
                    dfn["workload"] = fdir.name
                    dfn["sc_policy"] = pdir.name
                    dfn['tune']= tdir.name
                    dfn['seed'] = sdir.name

                    for arrr in range(0, 131, 1):
                        dfv = df[df.arrive_ratio==arrr]
                        if len(dfv) == 0:
                            dfv = df[(df.arrive_ratio>=arrr-1)&(df.arrive_ratio<=arrr+1)]
                            if len(dfv) == 0:
                                # print("No data:", arrr)
                                continue

                        frag_milli = dfv.origin_milli.mean()
                        frag_ratio = dfv.origin_ratio.mean()
                        # frag_milli = idle_milli * frag_ratio
                        dfn[arrr] = frag_ratio
                    
                    dfo = pd.DataFrame(dfn, index=[len(dflist)]).set_index(["workload", "sc_policy", "tune", "seed"])
                    dflist.append(dfo)

                    # if len(dflist) > 1:
                    #     exit_and_save_to_csv(dflist)

                except Exception as e:
                    exit("ERROR file: %s\n%s" % (afile, e))

exit_and_save_to_csv(dflist)