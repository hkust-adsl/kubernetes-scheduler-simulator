# 
# copied from open-simulator/scripts/analysis.py
import re
import pandas as pd

CLUSTER_PREFIX='gpu_'

def camel_to_snake(name):
    name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()

TAG_LIST = ["InitSchedule", "PostEviction", "PostDeschedule", "ScheduleInflation", "DescheduleInflation"]
TAG_SNAKE_LIST = [camel_to_snake(x) for x in TAG_LIST]

POLICY_ABBR_DICT = {
    '01-FragShare': 'FGD Coarse',
    '02-BestFit': 'BestFit',
    '08-DotProd_best_merge_max': 'DotProd',
    '28-Gandiva': 'Clustering',
    '29-Synergy': 'Synergy',
    '38-Packing': 'Packing',
    '40-FirstFit': 'FirstFit',
    '42-FragShareExtend_FragShareExtend_share_max': 'FGD',
    '43-Random_random': 'Random',
}

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
    
    out_row_list = []
    for _, row in df.iterrows():
        orig_dict = dict(row)
        meta_dict = {}
        for col in meta_col:
        # for col in NONTAG_COL:
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

# 09.06
TOTAL_NUM_GPU_DICT={
    "openb":       6212,
    }

def get_total_num_gpu(workload):
    key = None
    if workload.startswith(CLUSTER_PREFIX):
        key = "openb"
    return TOTAL_NUM_GPU_DICT.get(key, 1)

def parse_workload_name(x):
    return x

def shorten_self_policy(x):
    if "_" in x:
        l = x.split('_')
        if l[0].split('-')[1] == l[1]:
            l[1] = 'self'
            return '_'.join(l)
    return x
# dfn.sc_policy = dfn.sc_policy.apply(shorten_self_policy)
