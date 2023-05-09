
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
PAPER_PLOT=True # False: Plot with thinner lines for DingTalk or Doc usages
SAVEFIG=False    # False: plt.show()
TUNE_RATIO = 1.3
FIGNAME = "paib_alloc.pdf"

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

# openb, production workloads:

policy_keep = ['Random', 'DotProd', 'Clustering', 'Packing', 'BestFit', 'FGD']
policy_keepr = ['FGD', 'BestFit', 'Packing', 'Clustering', 'DotProd', 'Random']

TYPE=list(FILEDICT.keys())[0]
# ['alloc', 'frag_amount', 'frag_ratio']
dfnp = dfp_dict[TYPE]

colors = sns.color_palette()
colors.reverse()
colors = colors[-6:]

if TYPE=='alloc':
    dfnpp = dfnp[dfnp.workload==workload].copy()
    # print(dfnpp[dfnpp.arrive_rate==100].groupby(by='sc_policy').mean())
    dfnpp = dfnpp[dfnpp.sc_policy.isin(policy_keep)]

    plt.figure(figsize=(10, 3.5), dpi=120)
    sns.lineplot(data=dfnpp, x='arrive_rate', y='alloc_rate_reverse', hue='sc_policy', 
    style='sc_policy', estimator='median', errorbar=("pi", 50), 
    hue_order=policy_keep, style_order=policy_keepr, palette=colors)

    plt.plot([0, 100], [100, 0], label='Ideal', linestyle=':', color='grey', alpha=0.8)
    # plt.axvline(95, linestyle='--', color='gray', alpha=0.8)

    plt.grid(linestyle='-.', alpha=0.8)
    plt.xlabel('Arrived Workload (in Percentage of Cluster GPU Capacity)')
    # plt.title("%s" % (workload))
    # plt.show()

    if PAPER_PLOT:
        plt.ylabel('Unalloc. GPU (%)')
        plt.xlabel('Arrived workloads (in % of cluster GPU capacity)')
        plt.legend(loc='upper left', bbox_to_anchor=(1, 1.05), 
            prop={'size': 20}, frameon=False, borderpad=0)
        yhead = 25
        plt.xlim(100-yhead, 120)
        plt.ylim(0, yhead)
        plt.yticks([0,5,10,15,20,25])
    else:
        plt.ylabel('Unallocated GPU (%)')
        plt.legend(ncol=3)
        yhead = 20
        plt.xlim(100-yhead, None)
        plt.ylim(0, yhead)


# SAVEFIG=True    # False: plt.show()
if SAVEFIG:
    plt.savefig((FIGNAME), bbox_inches='tight')
else:
    plt.show()

# %%
