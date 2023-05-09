
# %%
# 1016
import matplotlib
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from pathlib import Path
from IPython.display import display
from utils import parse_workload_name, POLICY_ABBR_DICT

workload = 'openb_pod_list_default'
TYPE='frag_ratio'
PAPER_PLOT=True # False: Plot with thinner lines for DingTalk or Doc usages
SAVEFIG=False    # False: plt.show()
TUNE_RATIO = 1.3
FIGNAME = "paib_%s.pdf"

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

# openb, multi-GPUs workloads
# workload = 'cluster_openb-pod_openb-0820_a20aoc_gpu_nospec'
# workload = 'cluster_openb-pod_openb-0820_a30aoc_gpu_nospec'
# workload = 'cluster_openb-pod_openb-0820_a40aoc_gpu_nospec'
# workload = 'cluster_openb-pod_openb-0820_a50aoc_gpu_nospec'

# openb, non-GPU workloads
# workload = 'cluster_openb-pod_openb-0820_nocpu_gpu_nospec'

# openb, heterogeneous GPU types
# workload = 'cluster_openb-pod_openb-0820_gpu_gpuspec_05'
# workload = 'cluster_openb-pod_openb-0820_gpu_gpuspec_10'
# workload = 'cluster_openb-pod_openb-0820_gpu_gpuspec_20'
# workload = 'cluster_openb-pod_openb-0820_gpu_gpuspec_25'
# workload = 'cluster_openb-pod_openb-0820_gpu_gpuspec'

# mvap, GPU-sharing workloads
# workload = 'cluster_mvap-pod_mvap-0820_nomem_no_time-cap_1.0'

# policy_keep = ['FGD', 'Clustering', 'Packing', 'DotProd', 'BestFit', 'Random']
policy_keep = ['Random', 'DotProd', 'Clustering', 'Packing', 'BestFit', 'FGD']
policy_keepr = ['FGD', 'BestFit', 'Packing', 'Clustering', 'DotProd', 'Random']

# TYPE=list(FILEDICT.keys())[1]
# TYPE='frag_amount'
# ['alloc', 'frag_amount', 'frag_ratio']
dfnp = dfp_dict[TYPE]

colors = sns.color_palette()
colors.reverse()
colors = colors[-6:]

if TYPE=='frag_amount':
    dfnpp = dfnp[dfnp.workload==workload].copy()
    dfnpp = dfnpp[dfnpp.sc_policy.isin(policy_keep)]
    plt.figure(figsize=(10, 3.5), dpi=120)
    sns.lineplot(data=dfnpp, x='arrive_rate', y='frag_rate', hue='sc_policy', style='sc_policy',
                estimator='median', errorbar=("pi", 50), hue_order=policy_keep,
                style_order=policy_keepr, palette=colors)

    plt.grid(linestyle='-.', alpha=0.8)
    plt.legend(ncol=3)
    # plt.ylabel('GPU Fragment (%)')
    plt.ylabel('Frag / Total (%)')
    plt.xlabel('Arrived workloads (in % of cluster GPU capacity)')
    plt.xlim(0, None)
    plt.ylim(0, 20)
    # plt.title("%s" % (workload))
    # plt.show()

    if PAPER_PLOT:
        plt.legend(loc='upper left', bbox_to_anchor=(1, 1.05), 
            prop={'size': 20}, frameon=False, borderpad=0)
        plt.xlim(0, 120)
        # plt.ylim(0, yhead)
    else:
        plt.legend(ncol=3)
        # yhead = 20
        # plt.xlim(100-yhead, None)
        # plt.ylim(0, yhead)

elif TYPE=='frag_ratio':
    dfnpp = dfnp[dfnp.workload==workload].copy()
    dfnpp = dfnpp[dfnpp.sc_policy.isin(policy_keep)]
    plt.figure(figsize=(10, 3.5), dpi=120)
    sns.lineplot(data=dfnpp, x='arrive_rate', y='frag_rate', hue='sc_policy', style='sc_policy',
                estimator='median', errorbar=("pi", 50), hue_order=policy_keep,
                style_order=policy_keepr, palette=colors)
    plt.grid(linestyle='-.', alpha=0.8)
    plt.legend(ncol=3)
    plt.xlabel('Arrived workloads (in % of cluster GPU capacity)')
    # plt.ylabel('Fragment ratio (%)')
    plt.ylabel('Frag Rate (%)')
    plt.xlim(0, None)
    plt.ylim(0, 105)
    # plt.title("%s" % (workload))
    # plt.show()

    if PAPER_PLOT:
        plt.legend(loc='upper left', bbox_to_anchor=(1, 1.05), 
            prop={'size': 20}, frameon=False, borderpad=0)
        plt.xlim(0, 120)
        plt.yticks(range(0, 100+1, 25))
        # plt.ylim(0, yhead)
    else:
        plt.legend(ncol=3)
        # yhead = 20
        # plt.xlim(100-yhead, None)
        # plt.ylim(0, yhead)


SAVEFIG=True    # False: plt.show()
if SAVEFIG:
    plt.savefig((FIGNAME % TYPE), bbox_inches='tight')
else:
    plt.show()

# %%
