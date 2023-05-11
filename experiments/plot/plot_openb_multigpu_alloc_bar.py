
# %%
import matplotlib
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from pathlib import Path
from utils import parse_workload_name, POLICY_ABBR_DICT

PAPER_PLOT=False # False: Plot with thinner lines for Presentation
SAVEFIG=True     # False: plt.show()
TUNE_RATIO = 1.3
FIGNAME = "openb_multigpu_alloc_bar.pdf"

# openb, multi-GPUs workloads
workloads = ['openb_pod_list_multigpu20',
             'openb_pod_list_multigpu30',
             'openb_pod_list_multigpu40',
             'openb_pod_list_multigpu50',
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

policy_keep = ['FGD', 'BestFit', 'Packing', 'Clustering', 'DotProd', 'Random']

# ['alloc', 'frag_amount', 'frag_ratio']
dfnp = dfp_dict['alloc']

yhead = 30
dfnpp = dfnp[dfnp.workload.isin(workloads)][dfnp.arrive_rate==100].copy()
# print(dfnpp[dfnpp.workload == workloads[3]].groupby(by='sc_policy').mean())
dfnpp.workload = dfnpp.workload.apply(lambda x: 
{
    "openb_pod_list_multigpu20": '20%',
    "openb_pod_list_multigpu30": '30%',
    "openb_pod_list_multigpu40": '40%',
    "openb_pod_list_multigpu50": '50%',
}.get(x, x))
dfnpp = dfnpp[dfnpp.sc_policy.isin(policy_keep)]
plt.figure(figsize=(10, 3), dpi=120)
bars = sns.barplot(data=dfnpp, x='workload', y='alloc_rate_reverse', hue='sc_policy', errorbar='sd', hue_order=policy_keep, edgecolor="0")
hatches = [ "/" , "\\" , "|" , "-" , "+" , "x", "o", "O", ".", "*" ]
num_policy = len(policy_keep)
num_groups = len(bars.patches) // num_policy
for i, bar in enumerate(bars.patches):
    hatch_i = (i) // num_groups
    hatch_m = hatches[hatch_i % len(hatches)]
    bar.set_hatch(hatch_m)

# for i, container in enumerate(ax.containers):
#     ax.bar_label(container, label_type='edge', fmt='%0.1f%%', padding=10)
bars.bar_label(bars.containers[0], label_type='edge', fmt='%0.1f%%', padding=10)

plt.xlabel('Percentage of GPUs occupied by multi-GPU workloads') # plt.xlabel('Arrived Workload (in Percentage of Cluster GPU Capacity)')
plt.ylabel('Unallocated GPU (%)')

plt.legend()
plt.ylim(0, 21.7)
# plt.title("%s" % (workload))

plt.grid(linestyle='-.', alpha=0.8, axis='y')
# plt.legend(ncol=3, loc='upper right', bbox_to_anchor=(0.665, 1.03))
plt.legend(ncol=3, loc='upper left')
plt.xlabel('Proportion of multi-GPU workloads in terms of GPU requests')

SAVEFIG=True
if SAVEFIG:
    plt.savefig(FIGNAME, bbox_inches='tight')
else:
    plt.show()
