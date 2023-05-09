#!/bin/bash
DATE="2023_0511"
TRACE="openb_pod_list_default"
ln -s "../${DATE}/${TRACE}" ../data/

python3 merge_alloc_discrete_0920.py &
python3 merge_frag_discrete_0928.py &
python3 merge_frag_ratio_discrete_0928.py &
python3 merge_fail_pods_1010.py &