import re
import argparse
import subprocess
import pandas as pd
from pathlib import Path

ALLO_KEYS = ['MilliCpu','Memory','Gpu','MilliGpu']
QUAD_KEYS = ["q1_lack_both", 'q2_lack_gpu', 'q3_satisfied', 'q4_lack_cpu', 'xl_satisfied', 'xr_lack_cpu', 'no_access', "frag_gpu_milli"]

def camel_to_snake(name):
    name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()

TAG_LIST = ["InitSchedule", "PostEviction", "PostDeschedule", "ScheduleInflation", "DescheduleInflation"]
TAG_SNAKE_LIST = [camel_to_snake(x) for x in TAG_LIST]
HASTAG_COL = [camel_to_snake(x) for x in ALLO_KEYS]
HASTAG_COL.extend([camel_to_snake(x) for x in [ y + "Amount" for y in ALLO_KEYS]])
HASTAG_COL.extend(QUAD_KEYS)

def move_tag_to_new_column(df, tag_list=TAG_SNAKE_LIST):
    meta_col = []
    data_col = []
    for col in df.columns:
        is_data_col = False
        for tag in tag_list:
            if col.endswith("_" + tag):
                data_col.append(col)
                is_data_col = True
                break
        if is_data_col == False:
            meta_col.append(col)
    # print(meta_col)
    # print(data_col)
    
    out_row_list = []
    for _, row in df.iterrows():
        orig_dict = dict(row)
        meta_dict = {}
        for col in meta_col:
            if col in orig_dict:
                meta_dict[col] = orig_dict[col]
        # print("meta_dict:", meta_dict)

        for tag in tag_list:
            data_dict = {}
            data_dict.update(meta_dict)
            data_dict['tag'] = tag
            found = 0
            for col in data_col:
                if col.endswith("_" + tag):
                    key = col[:-(len(tag)+1)]
                    # print(tag, '+', key,'=',col)
                    data_dict[key] = orig_dict.get(col)
                    found = 1
            if found == 1:
                # print("data_dict:", data_dict)
                data_row = pd.DataFrame().from_dict(data_dict, orient='index').T
                out_row_list.append(data_row)
    return pd.concat(out_row_list)

def fillna_columns_with_tag(df):
    for x in ['milli_cpu', 'memory', 'gpu', 'milli_gpu', 'milli_cpu_amount', 'memory_amount', 'gpu_amount', 'milli_gpu_amount', 'q1_lack_both', 'q2_lack_gpu', 'q3_satisfied', 'q4_lack_cpu', 'xl_satisfied', 'xr_lack_cpu', 'no_access', 'frag_gpu_milli']:
        df.loc[df.isnull().any(axis=1), x+"_schedule_inflation"] = \
        df.loc[df.isnull().any(axis=1), x+"_init_schedule"]
    return df

def get_meta_dict_from_logname(log: str, log_dir: Path=None):
    if log.startswith("log-"):
        log = log[4:]

    meta_dict = {}
    meta = log.split('-')
    if len(meta) > 2: # e.g., ['cc_owtime_dr0.0_pe_md3d55.yaml', 'sc_packsim1000_deshare_gsGpu', 'Packing', 'Sim', 'Score_md87e2.yaml.log']
        meta[1] = "-".join(meta[1:]) # i.e., Gpu-Packing-Sim-Score can be reserved

    if log_dir: # experiment_dir
        # e.g., experiments/exp0516_1/log-cc_ow1000_dr0.0_pe_mde2bee5c4e1a7415b95ae76e10d556520.yaml-sc_frag1000_mdf0915880b7b35b894ada5b57a69c9e15.yaml.log
        exp_dir = Path(log_dir)
        cconfig, sconfig = meta[0].split('.yaml')[0], meta[1].split('.yaml')[0]
        cc_file = exp_dir / (cconfig + ".yaml")
        sc_file = exp_dir / (sconfig + ".yaml")
        if cc_file.is_file() and sc_file.is_file():
            for item in cconfig.split('_'):
                if item.startswith("ow"): # original workloads
                    meta_dict["ow"]=item.split("ow")[1]
                if item.startswith("dr"): # deschedule ratio
                    meta_dict["dr"]=float(item.split("dr")[1])
                if item.startswith("pe"): # export_pod_snapshot_yaml_file
                    meta_dict["pe"]=1
                if item.startswith("md"):
                    meta_dict["ccmd"] = item.split("md")[1]
                if item.startswith("dp"): # deschedule policy
                    meta_dict["dp"] = item.split("dp")[1]
                if item.startswith("tn"): # workload-tuning-ratio
                    meta_dict["tn"] = item.split("tn")[1]
                if item.startswith("ts"): # workload-tuning-seed
                    meta_dict["ts"] = item.split("ts")[1]
                if item.startswith("if"): # workload-inflation-ratio
                    meta_dict["if"] = item.split("if")[1]

            meta_dict["policy"] = ""
            for item in sconfig.split('_'):
                if item.startswith("sc"):
                    continue
                if item.startswith("md"):
                    meta_dict["scmd"] = item.split("md")[1]
                if item.startswith("de"): # dimension extension
                    meta_dict["de"] = item.split("de")[1]
                if item.startswith("gs"): # GPU selection
                    meta_dict["gs"] = item.split("gs")[1]
                else: # frag1000, or (bellman400 + sim400 + frag200)
                    meta_dict["policy"] += "_"+item if len(meta_dict) == 0 else item

        return meta_dict

    else:
        print("ERROR: log_dir is NONE")
        return meta_dict

def log_to_csv(log_path: Path, outfile: Path):
    out_frag_path = outfile.parent / (outfile.stem + '_frag.csv')
    out_allo_path = outfile.parent / (outfile.stem + '_allo.csv')
    out_cdol_path = outfile.parent / (outfile.stem + '_cdol.csv')
    # print("Handling logs under  :", log_path)
    
    NUM_CLUSTER_ANALYSIS_LINE = 16
    out_row_list = []
    out_frag_col_dict = {}
    out_allo_col_dict = {}
    out_cdol_col_dict = {}
    log_file_counter = 0
    for file in log_path.glob("*.log"):
        log = file.name
        with open(file, 'r') as f:
            try:
                meta_dict = get_meta_dict_from_logname(log=log, log_dir=log_path)
            except Exception as e:
                print("[Error] %s file failed in get_meta_dict_from_logname: %s" % (log, e))
                meta_dict = {}
            
            try:
                log_file_counter += 1
                # print('[%4d] %s => %s' % (log_file_counter, log, meta_dict))

                fail_dict = {'unscheduled': 0}
                allo_dict = {}
                quad_dict = {}
                amnt_dict = {}
                totl_dict = {}
                frag_list_dict = {}
                allo_list_dict = {}
                cdol_list_dict = {'id':[], 'event':[], 'pod_name':[], 'cum_pod':[0]}
                cdol_pod_dict = {}

                counter = 0
                tag = ""
                for i, line in enumerate(f.readlines()):
                    INFOMSG="level=info msg="
                    if INFOMSG not in line:
                        continue
                    line = line.split(INFOMSG)[1]
                    line = line[1:-2] # get rid of " and \n"

                    if "Number of original workload pods" in line:
                        fail_dict['origin_pods'] = int(line.split(":")[1].strip())

                    if 'there are' in line:
                        fail_dict['unscheduled'] = int(line.split("unscheduled pods")[0].split("there are")[1].strip())
                        break

                    if 'Cluster Analysis' in line:
                        tag = line.split(')')[0].split('(')[1]
                        counter += 1
                    if 0 < counter <= NUM_CLUSTER_ANALYSIS_LINE:
                        counter = 0 if counter == NUM_CLUSTER_ANALYSIS_LINE else counter + 1                        
                        
                        line = line.strip()
                        item = line.split(":")
                        if len(item) <= 1:
                            continue

                        key, value = item[0].strip(), item[1].strip()
                        if key in ALLO_KEYS:
                            ratio = float(value.split('%')[0])
                            allo_dict[camel_to_snake(key+tag)] = ratio
                            amount = float(value.split('(')[1].split('/')[0])
                            amnt_dict[camel_to_snake(key+'Amount'+tag)] = amount

                            total = float(value.split(')')[0].split('/')[1])
                            totl_dict[camel_to_snake(key+'Total')] = total # update without tag
                        elif key in QUAD_KEYS:
                            quad_dict[camel_to_snake(key+tag)] = float(value.split('(')[1].split('%')[0].strip())
                
                    # out_frag_col_dict
                    if line.startswith("[Report]"):
                        if len(line.split(';')) == 5: # Origin, e.g., "[Report]; Frag amount: 1317725.19; Frag ratio: 26.76%; Q124 ratio: 6.63%; (origin)\n" # 0528-
                            _, milli, ratio, q124, remark = line.split(';')
                            milli = float(milli.split(':')[1].strip())
                            ratio = float(ratio.split(':')[1].strip().split('%')[0])
                            q124 = float(q124.split(':')[1].strip().split('%')[0])
                            remark = remark.split('(')[1].split(')')[0].strip()
                            keys = [remark+"_milli", remark+"_ratio", remark+"_q124"]
                            values = [milli, ratio, q124]
                            for key, val in zip(keys, values):
                                if key in frag_list_dict:
                                    frag_list_dict[key].append(val)
                                else:
                                    frag_list_dict[key] = [val]
                        elif len(line.split(';')) == 4: # Bellman, e.g., "[Report]; Frag amount: 1260102.17; Frag ratio: 26.77%; (bellman)\n" # 0527-
                            _, milli, ratio, remark = line.split(';')
                            milli = float(milli.split(':')[1].strip())
                            ratio = float(ratio.split(':')[1].strip().split('%')[0])
                            remark = remark.split('(')[1].split(')')[0].strip()
                            keys = [remark+"_milli", remark+"_ratio"]
                            values = [milli, ratio]
                            for key, val in zip(keys, values):
                                if key in frag_list_dict:
                                    frag_list_dict[key].append(val)
                                else:
                                    frag_list_dict[key] = [val]
                        else: # e.g., "[Report] Frag amount: 37541.99 (origin)" # 0427-0526
                            frag, remark = float(line.split()[3]), line.split()[-1]
                            remark = remark.split(')')[0].split('(')[1] # get rid of '(' and ')'
                            if remark not in frag_list_dict:
                                frag_list_dict[remark] = [frag]
                            else:
                                frag_list_dict[remark].append(frag)

                    # out_allo_col_dict -- online allocation rate
                    if line.startswith("[Alloc]"):
                        if len(line.split(';')) == 5: # e.g., "[Alloc]; Used nodes: 52; Used GPUs: 383; Used GPU Milli: 375595; Total GPUs: 4933\n" # 0719-
                            _, un, ug, um, tg = line.split(';')
                            un = int(un.split(':')[1].strip())
                            ug = int(ug.split(':')[1].strip())
                            um = int(um.split(':')[1].strip())
                            tg = int(tg.split(':')[1].strip()[:-2])
                            keys = ["used_nodes","used_gpus","used_gpu_milli","total_gpus"]
                            values = [un, ug, um, tg]
                            for key, val in zip(keys, values):
                                if key in allo_list_dict:
                                    allo_list_dict[key].append(val)
                                else:
                                    allo_list_dict[key] = [val]
                        elif len(line.split(';')) == 6: # e.g., "[Alloc]; Used nodes: 91; Used GPUs: 183; Used GPU Milli: 173250; Total GPUs: 2099; Arrived GPU Milli: 173250\n" # 0927-
                            _, un, ug, um, tg, ag = line.split(';')
                            un = int(un.split(':')[1].strip())
                            ug = int(ug.split(':')[1].strip())
                            um = int(um.split(':')[1].strip())
                            tg = int(tg.split(':')[1].strip())
                            ag = int(ag.split(':')[1].strip()[:-2])
                            keys = ["used_nodes","used_gpus","used_gpu_milli","total_gpus","arrived_gpu_milli"]
                            values = [un, ug, um, tg, ag]
                            for key, val in zip(keys, values):
                                if key in allo_list_dict:
                                    allo_list_dict[key].append(val)
                                else:
                                    allo_list_dict[key] = [val]

                    # out_cdol_col_dict -- for online create/delete logs, extract their cumulative pod number
                    if "attempt to" in line:
                        cdol_meat = line.split()
                        if cdol_meat[0] == "[deletePod]": # last create failed
                            try:
                                cdol_list_dict['event'][-1] = 'failed'
                                cdol_list_dict['cum_pod'][-1] -= 1
                                pod_name = cdol_meat[6][4:-3] # pod(openb-gpu/openb-pod-0008) -> openb-gpu/openb-pod-0008
                                del cdol_pod_dict[pod_name]
                            except Exception as e:
                                print("[ERROR] cdol: probably empty cdol_list_dict(%s) encounters [deletePod], error: %s" % (cdol_list_dict, e))
                                continue
                        else:
                            event_id = int(cdol_meat[0][1:-1]) # [8] -> 8
                            event = cdol_meat[3] # create/delete
                            pod_name = cdol_meat[4][4:-3] # pod(openb-gpu/openb-pod-0008) -> openb-gpu/openb-pod-0008
                            cum_sum = cdol_list_dict['cum_pod'][-1]

                            if event == 'create':
                                if pod_name in cdol_pod_dict:
                                    print("[ERROR] cdol: Duplicated pod creation: %s" % cdol_meat) 
                                    continue
                                cdol_pod_dict[pod_name] = [event_id, None] # created at event_id=8
                                cum_sum += 1

                            elif event == "delete":
                                if pod_name in cdol_pod_dict:
                                    cdol_pod_dict[pod_name][1] = event_id # deleted at event_id=9
                                    cum_sum -= 1
                                else:
                                    event = 'skipped' # if the pod failed in creation, then no reduction in cumsum, and rename the delete event as "skipped", so as to align the total number of events
                            else:
                                print("[ERROR] cdol: Unrecognized event: %s" % cdol_meat)
                                continue

                            cdol_list_dict['id'].append(event_id)
                            cdol_list_dict['event'].append(event)
                            cdol_list_dict['pod_name'].append(pod_name)
                            cdol_list_dict['cum_pod'].append(cum_sum)


                out_dict = {}
                out_dict.update(meta_dict)
                out_dict.update(fail_dict)
                out_dict.update(allo_dict)
                out_dict.update(amnt_dict)
                out_dict.update(quad_dict)
                out_dict.update(totl_dict)
                out_row = pd.DataFrame().from_dict(out_dict, orient='index').T
                out_row_list.append(out_row)

                meta_as_key = "-".join(["%s_%s" % (k, v) for k, v in meta_dict.items()])
                for k, v in frag_list_dict.items():
                    out_frag_col_dict[meta_as_key+"-"+k] = v
                for k, v in allo_list_dict.items():
                    out_allo_col_dict[meta_as_key+"-"+k] = v
                cdol_list_dict['cum_pod'] = cdol_list_dict['cum_pod'][1:]
                if len(cdol_list_dict['cum_pod']) > 0:
                    for k, v in cdol_list_dict.items():
                        out_cdol_col_dict[meta_as_key+"-"+k] = v
            except Exception as e:
                print("[Error] Failed at", file, " with error:", e)

    outdf = pd.concat(out_row_list)
    outdf.to_csv(outfile, index=False)
    if len(out_frag_col_dict) > 0:
        df = pd.DataFrame().from_dict(out_frag_col_dict, orient='index').T
        if 'origin_pods' in df:
            df.sort_values('origin_pods', inplace=True, ascending=True)
        df.to_csv(out_frag_path, index=None) 
        # print("Export frag report at:", out_frag_path)
    if len(out_allo_col_dict) > 0:
        df = pd.DataFrame().from_dict(out_allo_col_dict, orient='index').T
        df.to_csv(out_allo_path, index=None)
    if len(out_cdol_col_dict) > 0:
        df = pd.DataFrame().from_dict(out_cdol_col_dict, orient='index').T
        df.to_csv(out_cdol_path, index=None)
    

def failed_pods_in_detail(log_path, outfile=None):
    outfilepath = outfile if outfile is not None else Path(log_path) / "analysis_fail.out"
    # print("Handling logs under:", log_path)
    print("Failed pods:", outfilepath)
    outfile = open(outfilepath, 'w')
    NUM_CLUSTER_ANALYSIS_LINE = 16
    out_row_list = []
    out_frag_col_dict = {}
    log_file_counter = 0
    for file in log_path.glob("*.log"):
        log = file.name
        with open(file, 'r') as f:
            try:
                log_file_counter += 1
                outfile.write("\n===\n%s\n" % log)
                fail_line_counter = 0
                rsrc_dict = {}
                for i, line in enumerate(f.readlines()):
                    if fail_line_counter == 0:
                        if "Failed Pods in detail" in line:
                            fail_line_counter = 1
                            # print("[DEBUG] start at #L", i)
                    else:
                        INFOMSG="level=info msg="
                        if INFOMSG not in line: # stop sign
                            # print("[DEBUG]  stop at #L", i, "total", fail_line_counter, "lines")
                            fail_line_counter = 0
                            sort_rsrc_dict = {k: v for k, v in sorted(rsrc_dict.items(), key=lambda item: -item[1])}
                            num_failed_pods = 0
                            for k, v in sort_rsrc_dict.items():
                                outfile.write("%2d; <%s>\n" % (v, k))
                                num_failed_pods += v
                            outfile.write("Failed No.: %d\n" % num_failed_pods)
                            rsrc_dict = {}
                            continue
                        fail_line_counter += 1
                        line = line.split(INFOMSG)[1]
                        line = line[1:-2] # get rid of " and \n"

                        rsrc = line.split("<")[1].split(">")[0]
                        if rsrc not in rsrc_dict:
                            rsrc_dict[rsrc] = 1
                        else :
                            rsrc_dict[rsrc] += 1

            except Exception as e:
                print("[Error] Failed at", file, " with error:", e)

def grep_log_cluster_analysis(log_path, outfile=None):
    outfile = Path(log_path) / "analysis_grep.out" if outfile is None else outfile
    print("Log grep:", outfile)
    if outfile.is_file():
        subprocess.call(["rm", "-f", outfile])
    for i, file in enumerate(log_path.glob("*.log")):
        # print('[%4d] %s'% (i + 1, file))
        with open(outfile, 'ab') as out:
            out.write(("\n===\n# %s:\n" % file.name).encode())
        
        with open(outfile, 'ab') as out:
            command_list = ["grep", "-e", "Cluster Analysis", "-A", "16", file]
            subprocess.call(command_list,stdout=out)  # it blocks. the python will exit but the process remains.
        
        # print("Done")



if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="add csv input")
    parser.add_argument("logfile", type=str, help="input log file", default='logs/')
    parser.add_argument("-o", "--outfile", type=str, help="output csv file", default=None)
    parser.add_argument("-g", "--grep", dest='grep', action='store_true', help="output grepped results")
    parser.add_argument("-f", "--failed", dest='failed', action='store_true', help='output failed pods')
    parser.add_argument("-s", "--skipped", dest='skipped', action='store_true', help='skip log_to_csv')
    parser.set_defaults(failed=False)
    args = parser.parse_args()

    ANAL_FILE = "analysis.csv"
    FAIL_FILE = ANAL_FILE.split('.csv')[0] + "_fail.out"
    GREP_FILE = ANAL_FILE.split('.csv')[0] + "_grep.out"

    # script_path = Path(os.path.dirname(os.path.realpath(__file__)))
    script_path = Path(__file__).parent # analysis.py is under "scripts/", so it needs to go to the root
    log_path = script_path.parent / args.logfile

    if args.failed:
        failed_pods_in_detail(log_path, log_path / FAIL_FILE)

    if args.grep:
        grep_log_cluster_analysis(log_path, log_path / GREP_FILE)

    if not args.skipped:
        outfile = log_path / "analysis.csv" if not args.outfile else Path(args.outfile)
        print("In: ", log_path, "\nOut:", outfile)
        log_to_csv(log_path, outfile)
