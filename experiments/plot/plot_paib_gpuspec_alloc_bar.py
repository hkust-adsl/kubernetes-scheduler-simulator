
# %%
# 1016
import matplotlib
from matplotlib import style
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from pathlib import Path
from IPython.display import display
from utils import parse_workload_name, POLICY_ABBR_DICT

PAPER_PLOT=False # False: Plot with thinner lines for DingTalk or Doc usages
SAVEFIG=False    # False: plt.show()
TUNE_RATIO = 1.3
FIGNAME = "paib_gpuspec_alloc_bar.pdf"

matplotlib.rcdefaults()
matplotlib.rcParams['pdf.fonttype'] = 42
if PAPER_PLOT:
    matplotlib.rcParams.update({"font.size": 24}) # for 24 for (8,6), 16 for (4,3)
    matplotlib.rcParams['lines.linewidth'] = 4 # 2.5
else:
    matplotlib.rcParams.update({"font.size": 14}) # for 24 for (8,6), 16 for (4,3)
    matplotlib.rcParams['lines.linewidth'] = 2 # 2.5

FILEDICT = {'alloc': "analysis_allo_discrete.csv",
            'frag_amount': "analysis_frag_discrete.csv",
            'frag_ratio': "analysis_frag_ratio_discrete.csv"}

dfp_dict = {}
for type, file in FILEDICT.items():
    if not Path(file).exists():
        print("file %s not found" % type)
        continue
    dfn = pd.read_csv(file)
    dfn['real_time'] = dfn['workload'].apply(lambda x: True if 'real_time' in x else False)
    dfn = dfn[~dfn.real_time]
    dfn.drop(columns=['real_time'], inplace=True)

    dfn['workload'] = dfn.workload.apply(parse_workload_name)

    workload_order = ['EightGpu80', 'EightGpu60', 'FourGpu80', 'FourGpu60', 'TwoGpu80', 'TwoGpu60', 'OneGpu80', 'OneGpu60', 'ShareGpu80', 'ShareGpu60', 'hhpai_0820','hhpai_0905','hhpai_mvap_0820', 'hhpai_mvap_0905', 'mit', 'mvap', 'paib']
    workload_order_dict = dict(zip(workload_order, range(1, len(workload_order)+1)))
    dfn.workload = dfn.workload.apply(lambda x: x if x not in workload_order_dict else "%02d-%s" % (workload_order_dict[x], x))

    # display(dfn)
    # print("SC_POLICY_LIST=[%s]" % (",".join("'%s'" % x for x in list(dfn.sc_policy.unique()))))

    dfn13 = dfn[dfn.tune == TUNE_RATIO].copy()
    cols = list(dfn13.columns)
    for col in ['workload','sc_policy','tune','seed','total_gpus']:
        if col in cols:
            cols.remove(col)

    if type == 'alloc':
        dfnp = pd.melt(dfn13, id_vars=['workload','sc_policy','seed'], value_vars=cols, 
                        var_name='arrive_rate', value_name="alloc_rate")
        dfnp['alloc_rate_reverse'] = 100 - dfnp["alloc_rate"]

    else: # 'frag_amount', 'frag_ratio'
        dfnp = pd.melt(dfn13, id_vars=['workload','sc_policy','seed'], value_vars=cols, 
                        var_name='arrive_rate', value_name="frag_rate")

    dfnp.arrive_rate = dfnp.arrive_rate.apply(int)
    dfnp.sc_policy = dfnp.sc_policy.apply(lambda x: POLICY_ABBR_DICT.get(x, x))
    dfp_dict[type] = dfnp

# openb, production workloads:
# workload = 'cluster_openb-pod_openb-0820_gpu_nospec'

# openb, multi-GPUs workloads
# workload = 'cluster_openb-pod_openb-0820_a20aoc_gpu_nospec'
# workload = 'cluster_openb-pod_openb-0820_a30aoc_gpu_nospec'
# workload = 'cluster_openb-pod_openb-0820_a40aoc_gpu_nospec'
# workload = 'cluster_openb-pod_openb-0820_a50aoc_gpu_nospec'
# workloads = ['cluster_openb-pod_openb-0820_a20aoc_gpu_nospec','cluster_openb-pod_openb-0820_a30aoc_gpu_nospec','cluster_openb-pod_openb-0820_a40aoc_gpu_nospec','cluster_openb-pod_openb-0820_a50aoc_gpu_nospec']

# openb, non-GPU workloads
# workload = 'cluster_openb-pod_openb-0820_nocpu_gpu_nospec'

# openb, heterogeneous GPU types
workload = 'cluster_openb-pod_openb-0820_gpu_gpuspec_05'
workload = 'cluster_openb-pod_openb-0820_gpu_gpuspec_10'
workload = 'cluster_openb-pod_openb-0820_gpu_gpuspec_20'
workload = 'cluster_openb-pod_openb-0820_gpu_gpuspec_25'
workload = 'cluster_openb-pod_openb-0820_gpu_gpuspec'
workloads = ['cluster_openb-pod_openb-0820_gpu_gpuspec_05',                 
            'cluster_openb-pod_openb-0820_gpu_gpuspec_10',
            'cluster_openb-pod_openb-0820_gpu_gpuspec_20',
            'cluster_openb-pod_openb-0820_gpu_gpuspec_25',
            'cluster_openb-pod_openb-0820_gpu_gpuspec']

# mvap, GPU-sharing workloads
# workload = 'cluster_mvap-pod_mvap-0820_nomem_no_time-cap_1.0'

# policy_keep = ['FGD', 'Clustering', 'Packing', 'DotProd', 'BestFit', 'Random']
policy_keep = ['FGD', 'BestFit', 'Packing', 'Clustering', 'DotProd', 'Random']
# policy_keep = ['BestFit', 'FGD Coarse', 'FGD']

# ['alloc', 'frag_amount', 'frag_ratio']
dfnp = dfp_dict['alloc']

yhead = 30
dfnpp = dfnp[dfnp.workload.isin(workloads)][dfnp.arrive_rate==100].copy()
dfnpp.workload = dfnpp.workload.apply(lambda x: 
{
    'cluster_openb-pod_openb-0820_gpu_gpuspec_05': '5%',
    'cluster_openb-pod_openb-0820_gpu_gpuspec_10': '10%',
    'cluster_openb-pod_openb-0820_gpu_gpuspec_20': '20%',
    'cluster_openb-pod_openb-0820_gpu_gpuspec_25': '25%',
    'cluster_openb-pod_openb-0820_gpu_gpuspec': '33%',
}.get(x, x))
dfnpp = dfnpp[dfnpp.sc_policy.isin(policy_keep)]
plt.figure(figsize=(10, 3), dpi=120)
bars = sns.barplot(data=dfnpp, x='workload', y='alloc_rate_reverse', hue='sc_policy', errorbar='sd', hue_order=policy_keep, order=['10%','20%','25%','33%'], edgecolor="0")
# for i, container in enumerate(ax.containers):
#     ax.bar_label(container, label_type='edge', fmt='%0.1f%%', padding=10)
hatches = [ "/" , "\\" , "|" , "-" , "+" , "x", "o", "O", ".", "*" ]
num_policy = len(policy_keep)
num_groups = len(bars.patches) // num_policy
for i, bar in enumerate(bars.patches):
    hatch_i = (i) // num_groups
    hatch_m = hatches[hatch_i % len(hatches)]
    bar.set_hatch(hatch_m)
bars.bar_label(bars.containers[0], label_type='edge', fmt='%0.1f%%', padding=5)

plt.xlabel('Percentage of GPUs occupied by workloads with GPU type constraints')
plt.ylabel('Unallocated GPU (%)')

plt.legend()
# plt.xlabel('Arrived Workload (in Percentage of Cluster GPU Capacity)')
# plt.ylabel('Unallocated GPU (%)')
# plt.xlim(100-yhead, None)
plt.ylim(0, 21.7)
# plt.title("%s" % (workload))
# plt.show()

plt.grid(linestyle='-.', alpha=0.8, axis='y')
# plt.legend(ncol=3, loc='upper right', bbox_to_anchor=(0.665, 1.03))
plt.legend(ncol=3, loc='upper left')
plt.xlabel('Proportion of workloads with GPU type constraints in terms of GPU requests')

SAVEFIG=True
if SAVEFIG:
    plt.savefig(FIGNAME, bbox_inches='tight')
else:
    plt.show()
