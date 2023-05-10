
# %%
# 1016
from email import policy
from ssl import ALERT_DESCRIPTION_HANDSHAKE_FAILURE
import matplotlib
from matplotlib import style
from matplotlib import hatch
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from pathlib import Path
from IPython.display import display
from utils import parse_workload_name, POLICY_ABBR_DICT

PAPER_PLOT=False # False: Plot with thinner lines for DingTalk or Doc usages
SAVEFIG=True     # False: plt.show()
TUNE_RATIO = 1.3
FIGNAME = "paib_gpushare_alloc_bar.pdf"

# openb, GPU-sharing workloads
workloads = ['openb_pod_list_gpushare20',
             'openb_pod_list_gpushare40',
             'openb_pod_list_gpushare60',
             'openb_pod_list_gpushare80',
             'openb_pod_list_gpushare100',
]

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


# policy_keep = ['FGD', 'Packing', 'Clustering', 'DotProd', 'BestFit', 'Random']
policy_keep = ['FGD', 'BestFit', 'Packing', 'Clustering', 'DotProd', 'Random']
# policy_keep = ['BestFit', 'FGD Coarse', 'FGD']


# ['alloc', 'frag_amount', 'frag_ratio']
dfnp = dfp_dict['alloc']

yhead = 30
dfnpp = dfnp[dfnp.workload.isin(workloads)][dfnp.arrive_rate==100].copy()
# print(dfnpp[dfnpp.workload == workloads[4]].groupby(by='sc_policy').mean())
# print(dfnpp['sc_policy', ])
# dfnpp.workload = dfnpp.workload.apply(lambda x: 
# {
#     'cluster_openb-pod_openb-0820_cpu037_gpu_nospec': 'CPU037',
#     'cluster_openb-pod_openb-0820_cpu050_gpu_nospec': 'CPU050',
#     'cluster_openb-pod_openb-0820_cpu072_gpu_nospec': 'CPU072',
#     'cluster_openb-pod_openb-0820_cpu100_gpu_nospec': 'CPU100',
#     'cluster_openb-pod_openb-0820_cpu200_gpu_nospec': 'CPU200',
#     'cluster_openb-pod_openb-0820_cpu235_gpu_nospec': 'CPU235',
# }.get(x, x))
dfnpp.workload = dfnpp.workload.apply(lambda x:
{
    'openb_pod_list_gpushare20': '20%',
    'openb_pod_list_gpushare40': '40%',
    'openb_pod_list_gpushare60': '60%',
    'openb_pod_list_gpushare80': '80%',
    'openb_pod_list_gpushare100': '100%',
}.get(x, x))
dfnpp = dfnpp[dfnpp.sc_policy.isin(policy_keep)]
plt.figure(figsize=(10, 3), dpi=120)
bars = sns.barplot(data=dfnpp, x='workload', y='alloc_rate_reverse', 
                hue='sc_policy', errorbar='sd', 
                hue_order=policy_keep, order=['40%','60%','80%','100%'], edgecolor="0")
hatches = [ "/" , "\\" , "|" , "-" , "+" , "x", "o", "O", ".", "*" ]
num_policy = len(policy_keep)
num_groups = len(bars.patches) // num_policy
for i, bar in enumerate(bars.patches):
    hatch_i = (i) // num_groups
    hatch_m = hatches[hatch_i % len(hatches)]
    bar.set_hatch(hatch_m)
# for i, container in enumerate(bars.containers):
#     bars.bar_label(container, label_type='edge', fmt='%0.1f%%', padding=5)
bars.bar_label(bars.containers[0], label_type='edge', fmt='%0.1f%%', padding=5)

plt.xlabel('Percentage of GPUs occupied by GPU-sharing workloads')
plt.ylabel('Unallocated GPU (%)')

plt.legend()
# plt.xlabel('Arrived Workload (in Percentage of Cluster GPU Capacity)')
# plt.ylabel('Unallocated GPU (%)')
# plt.xlim(100-yhead, None)
plt.ylim(0, 21.7)
# plt.title("%s" % (workload))
# plt.show()

plt.grid(linestyle='-.', alpha=0.8, axis='y')
plt.legend(ncol=3, loc='lower center')
plt.xlabel('Proportion of GPU-sharing workloads in terms of GPU requests')

SAVEFIG=True    # False: plt.show()
if SAVEFIG:
    plt.savefig(FIGNAME, bbox_inches='tight')
else:
    plt.show()
