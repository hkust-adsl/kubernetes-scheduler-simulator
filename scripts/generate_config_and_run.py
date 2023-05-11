import os
import yaml
import shutil
import argparse
import subprocess
from hashlib import md5
from pathlib import Path
""" Usage: openb 0 =FGD_1000=> 2K pods
EXPDIR="experiments/2023_0511/openb_pod_list_default/06-FGD" 
mkdir -p ${EXPDIR} && touch "${EXPDIR}/terminal.out"
python3 scripts/generate_config_and_run.py -d "${EXPDIR}" \
-seed 233 \
-e -b \
-f data/openb_pod_list_default \
-FGD 1000 \
-y "${EXPDIR}/snapshot/ds01" | tee -a "${EXPDIR}/terminal.out" \
&& \ 
python3 scripts/analysis.py -f -g ${EXPDIR} | tee -a "${EXPDIR}/terminal.out"
"""

# Add new scheduler policy here
SCORE_POLICY_ABBR = {
    "RandomScore":        "Random",
    "DotProductScore":    "DotProd",
    "GpuClusteringScore": "GpuClustering",
    "GpuPackingScore":    "GpuPacking",
    "BestFitScore":       "BestFit",
    "FGDScore":           "FGD",
}

SCORE_PLUGINS_WITH_DIM_NORM_GPU_METHOD = [
    "DotProductScore", # dot product
    "FGDScore",        # FGD
]
SCORE_PLUGINS_WITH_PRE_FILTER = [
]
SCORE_PLUGINS_WITH_PRE_SCORE = [
    "RandomScore",
]

def get_args():
    parser = argparse.ArgumentParser(description='generate cluster configuration yaml')
    # exp
    parser.add_argument('-d', '--experiment-dir', type=str, default='./', help='Experiment directory (default: ./)')
    parser.add_argument('-e', '--execute', dest="execute", action="store_true", default=False, help="execute simon binary")
    parser.add_argument('-b', '--block', dest="block", action="store_true", default=False, help="Blocked execution, wait until simon finishes")

    # cluster config
    parser.add_argument('-f', '--custom-config', type=str, help='path to YAML file containing origin cluster node and pod list')
    parser.add_argument('-r', '--deschedule-ratio', type=float, default=0.0, help='deschedule ratio')
    parser.add_argument('-p', '--deschedule-policy', type=str, default=None, help='deschedule policy: fragMultiPod, cosSim, fragOnePod. default: None')
    parser.add_argument('-n', '--new-workload-config', type=str, default=None, help='path to YAML file containing new workload pod list')

    parser.add_argument('-y', '--export-pod-snapshot-yaml-file-prefix', type=str, default=None, help='path to which pod snapshot are exported as yaml file')
    parser.add_argument('-z', '--export-node-snapshot-csv-file-prefix', type=str, default=None, help='path to which node snapshot are exported as csv file')
    parser.add_argument('--is-involved-cpu-pods', type=str, default="true", help='whether to consider CPU pods in typical pods (default: true)')
    parser.add_argument('--pod-popularity-threshold', type=int, default=95, help='pod popularity threshold (default: 95)')
    parser.add_argument('--pod-increase-step', type=int, default=1, help='pod increase step (default: 1)')
    parser.add_argument('--gpu-res-weight', type=float, default=0, help='GPU resource weight (default: 0)')

    parser.add_argument('--cluster-name', type=str, default='simon-openb-config', help='name of the cluster config')
    parser.add_argument('-a', '--applist-path', type=str, default=None, help='path to the app list')
    parser.add_argument('--applist-name', type=str, default=None, help='name of the app list')
    parser.add_argument('--new-node', type=str, default="example/newnode/gpushare")
    parser.add_argument('--shuffle-pod', type=str, default="false", help='whether to shuffle pod. true is to shuffle, false (default) respect the submission order')
    parser.add_argument('--workload-inflation-ratio', type=float, default=1, help='workload inflation ratio, <= 1 takes no effects')
    parser.add_argument('-seed','--workload-inflation-seed', type=int, default=233, help='workload inflation seed')
    parser.add_argument('-tune', '--workload-tuning-ratio', type=float, default=0, help='workload tuning ratio, <= 0 takes no effects')
    parser.add_argument('-tuneseed','--workload-tuning-seed', type=int, default=233, help='workload tuning seed')

    # scheduler config
    for policy_name, policy_abbr in SCORE_POLICY_ABBR.items():
        parser.add_argument("-%s" % policy_abbr, type=int, default=0, help="score (default: 0)")

    # scheduler plugin config
    parser.add_argument("-gpusel", "--gpu-sel-method", dest="gpu_sel_method", type=str, default="best", 
                            help="GPU selection method: best, worst, random, default: best")
    parser.add_argument("-dimext", "--dim-ext-method", dest="dim_ext_method", type=str, default="share", 
                            help="Dimension extend method: merge, share, divide, extend, default: share")
    parser.add_argument("-norm", "--norm-method", dest="norm_method", type=str, default="max", 
                            help="Norm method: node, pod, max, default: max")

    args = parser.parse_args()
    return args

LOGSEP, FILESEP = "-", "_"
TagInitSchedule = "InitSchedule"
TagPostDeschedule = "PostDeschedule"

CLUSTER_CONFIG_TEMPLATE="""
apiVersion: simon/v1alpha1
kind: Config
metadata:
  name: simon-openb-config
spec:
  appList:
  # - name: pai_gpu
  #   path: data/pai_b/application
  cluster:
    customConfig: "data/cluster_openb-origin_workload"
  newNode: example/newnode/gpushare
  customConfig:
    shufflePod: false
    exportConfig:
      # podSnapshotYamlFilePrefix: "snapshot/pod_snapshot"
      # nodeSnapshotCSVFilePrefix: "snapshot/node_snapshot"
    workloadInflationConfig:
      ratio: 1
      seed: 233
    workloadTuningConfig:
      ratio: 0
      seed: 233
    descheduleConfig:
      ratio: 0.1
      # policy: cosSim
      # policy: fragOnePod
      # policy: fragMultiPod
    newWorkloadConfig: # "data/cluster_openb-new_workload"
    typicalPodsConfig:
      isInvolvedCpuPods: true
      podPopularityThreshold: 95
      podIncreaseStep: 1
      gpuResWeight: 0
"""

def generate_cluster_config(args, outdir):
    template = yaml.safe_load(CLUSTER_CONFIG_TEMPLATE)
    for k, v in template.items():
        if k == "metadata":
            v["name"] = args.cluster_name
        elif k == "spec":
            if args.applist_path is not None:
                applist_name = "pai_gpu" if args.applist_name is None else args.applist_name
                v["appList"] = [dict()]
                v["appList"][0]["name"] = applist_name
                v["appList"][0]["path"] = args.applist_path

            v['cluster']["customConfig"] = args.custom_config
            v['newNode'] = args.new_node

            v['customConfig']['shufflePod'] = True if args.shuffle_pod.lower() == "true" else False
            v['customConfig']['exportConfig'] = {}
            v['customConfig']['exportConfig']['podSnapshotYamlFilePrefix'] = args.export_pod_snapshot_yaml_file_prefix
            v['customConfig']['exportConfig']['nodeSnapshotCSVFilePrefix'] = args.export_node_snapshot_csv_file_prefix
            v['customConfig']['workloadInflationConfig']['ratio'] = args.workload_inflation_ratio
            v['customConfig']['workloadInflationConfig']['seed'] = args.workload_inflation_seed
            v['customConfig']['workloadTuningConfig']['ratio'] = args.workload_tuning_ratio
            v['customConfig']['workloadTuningConfig']['seed'] = args.workload_tuning_seed
            v['customConfig']['descheduleConfig']['ratio'] = args.deschedule_ratio
            if args.deschedule_policy is not None:
                v['customConfig']['descheduleConfig']['policy'] = args.deschedule_policy
            
            if args.new_workload_config is not None:
                v['customConfig']['newWorkloadConfig'] = args.new_workload_config
            v['customConfig']['typicalPodsConfig']['isInvolvedCpuPods'] = True if args.is_involved_cpu_pods.lower() == "true" else False
            v['customConfig']['typicalPodsConfig']['podPopularityThreshold'] = args.pod_popularity_threshold
            v['customConfig']['typicalPodsConfig']['podIncreaseStep'] = args.pod_increase_step
            v['customConfig']['typicalPodsConfig']['gpuResWeight'] = args.gpu_res_weight
    
    # print(template)
    content = yaml.dump(template)
    md = md5()
    md.update(content.encode())
    filename = "cc" # cluster-config

    def path_str_shorten(str):
        str = "" if str is None or len(str) == 0 else str
        str = str.split("/")[-1] if "/" in str else str
        str = str.split("-")[-1] if "-" in str else str
        str = str.split("_")[-1] if "_" in str else str
        str = str.split(".yaml")[0] if ".yaml" in str else str
        str = str[-12:] if len(str) > 12 else str
        return str
    
    filename += FILESEP + "ow%s" % path_str_shorten(args.custom_config) if args.custom_config is not None else "" # original-workload
    filename += FILESEP + "nw%s" % path_str_shorten(args.new_workload_config) if args.new_workload_config is not None else "" # new-workload
    filename += FILESEP + "dr%.1f" % args.deschedule_ratio # deschedule-ratio
    filename += FILESEP + "dp%s" % args.deschedule_policy if args.deschedule_policy is not None else "" # deschedule-policy
    filename += FILESEP + "pe" if args.export_pod_snapshot_yaml_file_prefix is not None else "" # pod-export
    filename += FILESEP + "tn%.1f" % args.workload_tuning_ratio # workload-tuning-ratio
    filename += FILESEP + "ts%d" % args.workload_tuning_seed # workload-tuning-ratio
    filename += FILESEP + "if%.1f" % args.workload_inflation_ratio # workload-inflation-ratio
    filename += FILESEP + "md" + md.hexdigest()[:4] # md5
    filename += ".yaml"
    outfile = outdir / filename
    with open(outfile, "w") as f:
        yaml.dump(template, f)
    return outfile

SCHEDULER_CONFIG_TEMPLATE="""
apiVersion: kubescheduler.config.k8s.io/v1beta1
kind: KubeSchedulerConfiguration
percentageOfNodesToScore: 100
profiles:
  - schedulerName: simon-scheduler
    plugins:
      filter:
        enabled:
          - name: Open-Gpu-Share
      preScore:
        disabled:
          - name: RandomScore
        enabled:
      score:
        disabled:
          - name: RandomScore
          - name: DotProductScore
          - name: GpuClusteringScore
          - name: GpuPackingScore
          - name: BestFitScore
          - name: FGDScore
          # 
          - name: ImageLocality
          - name: NodeAffinity
          - name: PodTopologySpread
          - name: TaintToleration
          - name: NodeResourcesBalancedAllocation
          - name: InterPodAffinity
          - name: NodeResourcesLeastAllocated
          - name: NodePreferAvoidPods
        enabled:
      reserve:
        enabled:
          - name: Open-Gpu-Share
      bind:
        disabled:
          - name: DefaultBinder
        enabled:
          - name: Simon
"""

def generate_scheduler_config(args, outdir):
    template = yaml.safe_load(SCHEDULER_CONFIG_TEMPLATE)
    for k, v in template.items():
        if k == "profiles":
            # generate score plugin entries
            s = v[0]['plugins']['score']
            s['enabled'] = []

            for policy_name, policy_abbr in SCORE_POLICY_ABBR.items():
                if args.__dict__.get(policy_abbr, 0) > 0:
                    s['enabled'].append({'name': policy_name, 'weight': args.__dict__.get(policy_abbr, 0)})

                    # for fragsharesim, add prefilter
                    if policy_name in SCORE_PLUGINS_WITH_PRE_FILTER:
                        prefilter = v[0]['plugins']['preFilter']
                        if 'enabled' not in prefilter or type(prefilter['enabled']) != list:
                            prefilter['enabled'] = []
                        prefilter['enabled'].append({'name': policy_name})
                    
                    if policy_name in SCORE_PLUGINS_WITH_PRE_SCORE:
                        prescore = v[0]['plugins']['preScore']
                        if 'enabled' not in prescore or type(prescore['enabled']) != list:
                            prescore['enabled'] = []
                        prescore['enabled'].append({'name': policy_name})

            # generate pluginConfig via "enabled"
            v[0]['pluginConfig'] = []
            pc = v[0]['pluginConfig']
            ##: select the score with max weight as gpuSelMethod in Open-Gpu-Share's Reserve
            maxScoreName, maxScoreWeight = None, 0
            for item in template['profiles'][0]['plugins']['score']['enabled']:
                if item['weight'] > maxScoreWeight:
                    maxScoreName = item['name']
                    maxScoreWeight = item['weight']
                ###: configure score plugins with the input "dimExtMethod" and "normMethod", works for SCORE_PLUGINS_WITH_DIM_NORM_GPU_METHOD
                pc.append({'name': item['name'], 'args': {'dimExtMethod': args.dim_ext_method, 'normMethod': args.norm_method}})
            if maxScoreName in SCORE_PLUGINS_WITH_DIM_NORM_GPU_METHOD:
                ##: if the max-weight score requires gpuSelMethod and has its own opinions on "dim_ext_method"
                if args.dim_ext_method != "merge":
                    ###: replacing the default gpuSelMethods (best, worst, random) with the implemented score plugins (use score plugin name as key).
                    args.gpu_sel_method = maxScoreName
            ###: normMethod should be set twice: in Open-Gpu-Share and in each score plugins
            pc.append({'name': "Open-Gpu-Share", 'args': {'gpuSelMethod': args.gpu_sel_method, 'dimExtMethod': args.dim_ext_method, 'normMethod':args.norm_method}})

    # print(template)
    content = yaml.dump(template)
    md = md5()
    md.update(content.encode())
    filename = "sc" # scheduler-config
    for item in template['profiles'][0]['plugins']['score']['enabled']:
        filename += FILESEP + SCORE_POLICY_ABBR[item['name']] + str(item['weight'])
    filename += FILESEP + "de%s" % str(args.dim_ext_method) if args.dim_ext_method else ""  # dim-ext-method
    filename += FILESEP + "gs%s" % str(args.gpu_sel_method) if args.gpu_sel_method else ""  # gpu-sel-method
    filename += FILESEP + "md" + md.hexdigest()[:4]
    filename += ".yaml"
    outfile = outdir / filename
    with open(outfile, "w") as f:
      yaml.dump(template, f)
    return outfile

def prepare_snapshot(args):
    if not args.export_pod_snapshot_yaml_file_prefix:
        # print("args.export_pod_snapshot_yaml_file_prefix is None")
        return []
    if not args.custom_config:
        print("args.custom_config is None")
        return []
    node_file = None
    for file in Path(args.custom_config).glob("*node*.yaml"):
        node_file = file
    if not node_file:
        print("no node.yaml file in %s" % args.custom_config)
        return []
    res = []

    tag = TagInitSchedule
    snapshot_dir = "%s/%s/" % (args.export_pod_snapshot_yaml_file_prefix, tag)
    os.makedirs(snapshot_dir, exist_ok=True)
    shutil.copy(node_file, Path(snapshot_dir))
    print("    sI:", snapshot_dir) # snapshot-InitSchedule
    res.append(snapshot_dir)

    if args.deschedule_ratio > 0 and args.deschedule_policy:
        tag = TagPostDeschedule
        snapshot_dir = "%s/%s/" % (args.export_pod_snapshot_yaml_file_prefix, tag)
        os.makedirs(snapshot_dir, exist_ok=True)
        shutil.copy(node_file, Path(snapshot_dir))
        print("    sP:", snapshot_dir) # snapshot-PostDeschedule
        res.append(snapshot_dir)

    return res

def exp(args):
    """
    - home
      - experiment_dir_1
        - cc_1.yaml
        - sc_1.yaml
        - snapshot_1
          - snapshot_1_pod.yaml
        - log-1.log
        - cc_2.yaml
        - sc_2.yaml
        - snapshot_2
          - snapshot_2_pod.yaml
        - log-2.log
        ...
      - experiment_dir_2
        - cc_1.yaml
        - sc_1.yaml
        ...
    """

    expdir = Path(args.experiment_dir)
    os.makedirs(expdir, exist_ok=True)
    print("ExpDir: %s" % expdir)
    cluster_file = None
    scheduler_file = None

    # if args.cluster_config:
    custom_config_path = Path(args.custom_config)
    if not custom_config_path.exists() or not custom_config_path.is_dir():
        exit("[WARNING] --custom-config (-f) path not exist or not a dir: %s" % custom_config_path)
    if len([x for x in custom_config_path.glob("*.yaml")]) == 0:
        exit("[WARNING] --custom-config (-f) path has no yaml file: %s" % custom_config_path)

    cluster_dir = expdir
    cluster_file = generate_cluster_config(args, cluster_dir)
    cluster_file = Path(cluster_file)
    print("    cc: %s" % cluster_file)

    # if args.export_pod_snapshot_yaml_file_prefix:
    snapshots = prepare_snapshot(args)

    # if args.scheduler_config:
    scheduler_dir = expdir
    scheduler_file = generate_scheduler_config(args, scheduler_dir)
    scheduler_file = Path(scheduler_file)
    print("    sc: %s" % scheduler_file)

    log_file = ""
    command = ""
    if cluster_file and scheduler_file:
        log_dir = expdir
        log_file = log_dir / ("log%s%s%s%s.log" % (LOGSEP, cluster_file.name, LOGSEP, scheduler_file.name))
        ## start experiments
        command = './bin/simon apply --extended-resources "gpu" -f %s --default-scheduler-config %s' % (cluster_file, scheduler_file)
        print("    Ex:", command)
        print("    >>:", log_file, "\n")
        if args.execute:
            with open(log_file,"wb") as log, open(log_file,"wb") as log:
                if args.block:
                    subprocess.call(command.split(),stdout=log,stderr=log)  # it blocks. the python will exit but the process remains.
                else:
                    subprocess.Popen(command.split(),stdout=log,stderr=log)  # it is non-block. the python will exit but the process remains.
    else:
        print("  Exit without execution")

    return cluster_file, scheduler_file, log_file, command

if __name__ == '__main__':
    args = get_args()
    exp(args)
