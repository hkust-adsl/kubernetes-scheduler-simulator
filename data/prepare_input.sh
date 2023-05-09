for file in csv/openb_pod_list*; do
    echo $file
    filename="${file##*/}"
    OUTDIR="${filename%.*}"
    mkdir -p $OUTDIR
    cp node_yaml/openb_node_list_gpu_node.yaml $OUTDIR/
    python3 pod_csv_to_yaml.py $file &
done