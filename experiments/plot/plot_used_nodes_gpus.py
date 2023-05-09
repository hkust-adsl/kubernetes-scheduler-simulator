
# %%
import matplotlib
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from pathlib import Path
from IPython.display import display
from utils import parse_workload_name, POLICY_ABBR_DICT

PAPER_PLOT=True # False: Plot with thinner lines for DingTalk or Doc usages
SAVEFIG=False    # False: plt.show()
TYPE = "nodes"
# TYPE = "gpus"
INFILE = "openb_gpu_nospec-used_%s.csv" % TYPE
FIGNAME = "paib_used_%s.pdf" % TYPE

matplotlib.rcdefaults()
matplotlib.rcParams['pdf.fonttype'] = 42
if PAPER_PLOT:
    matplotlib.rcParams.update({"font.size": 24}) # for 24 for (8,6), 16 for (4,3)
    matplotlib.rcParams['lines.linewidth'] = 4 # 2.5
else:
    matplotlib.rcParams.update({"font.size": 14}) # for 24 for (8,6), 16 for (4,3)
    matplotlib.rcParams['lines.linewidth'] = 2 # 2.5

df = pd.read_csv(INFILE, index_col=0)
# policies = df.columns[1:]
policy_keep = ['Random', 'DotProd', 'Clustering', 'Packing', 'BestFit', 'FGD']

# %%

colors = sns.color_palette()
colors.reverse()
colors = colors[-6:]

linestyles = [
     ('solid', 'solid'),      # Same as (0, ()) or '-'
     ('dashed', 'dashed'),    # Same as '--'
     ('dotted', 'dotted'),    # Same as (0, (1, 1)) or '.'
     ('densely dashdotted',    (0, (3, 1, 1, 1))),
     ('dashdot', 'dashdot'),   # Same as '-.'
     ('densely dashdotdotted', (0, (3, 1, 1, 1, 1, 1))),
] # https://matplotlib.org/3.1.0/gallery/lines_bars_and_markers/linestyles.html
linestyles.reverse()

plt.figure(figsize=(10, 3.5), dpi=120)
for i, policy in enumerate(policy_keep):
    plt.plot(df['arrived_ratio'], df[policy], label=policy,
        color=colors[i], linestyle=linestyles[i][1], alpha=0.9)

plt.grid(linestyle='-.', alpha=0.8)
if PAPER_PLOT==False:
    plt.legend(loc='lower right', ncol=3)
    plt.xlabel('Arrived Workload (in Percentage of Cluster GPU Capacity)')
    plt.ylabel('Occupied GPU Nodes')
    plt.xlim(0, 100)
    plt.ylim(0, 1250)
    plt.yticks(range(0, 1250+1, 250))
else:
    plt.legend(loc='upper left', bbox_to_anchor=(1, 1.0), 
        prop={'size': 20}, frameon=False, borderpad=0)
    plt.xlabel('Arrived workloads (in % of cluster GPU capacity)')
    plt.ylabel('Occupied nodes')
    plt.xlim(0, 110)
    plt.ylim(0, None)
    plt.yticks(range(0, 1250+1, 250))

# plt.title("%s" % (workload))

# SAVEFIG=True    # False: plt.show()
if SAVEFIG:
    plt.savefig((FIGNAME), bbox_inches='tight')
else:
    plt.show()
# %%
