import yaml
import random
import shutil
import argparse
from pathlib import Path

def inject_origin_workload_into_snapshot(origin, snapshot):
    origin_path = Path(args.origin)
    snapshot_path = Path(args.snapshot)
    origin_yaml = None
    for file in origin_path.glob("*pod*.yaml"):
        origin_yaml = file
    snapshot_yaml = None
    for file in snapshot_path.glob("pod-snapshot.yaml"):
        snapshot_yaml = file
    if origin_yaml is None or snapshot_yaml is None:
        exit("origin or snapshot yaml not found")

    outfile = Path(snapshot_yaml)
    snapshot = snapshot_yaml.parent / (snapshot_yaml.stem + ".bak")
    shutil.copy2(snapshot_yaml, snapshot)
    iter_snapshot = yaml.safe_load_all(open(snapshot, 'r'))
    iter_origin = yaml.safe_load_all(open(origin_yaml, 'r'))

    ssid = random.randint(1000, 9999) # snapshot id, making 2 snapshots gives 0.01% chance of collision
    index = 0
    for pod_yaml in iter_snapshot:
        if pod_yaml is None or len(pod_yaml) == 0:
            continue
        pod_yaml["metadata"]["name"] += "-ss%d" % ssid
        pod_yaml["metadata"]["annotations"]["alibabacloud.com/creation-time"] = "1970-01-01T00:00:00Z"
        if index == 0:
            with open(outfile, 'w') as file:
                yaml.dump(pod_yaml, file)
        else:
            with open(outfile, 'a') as file:
                file.writelines(['\n---\n\n'])
                yaml.dump(pod_yaml, file)    
        index += 1
        # print(index)
    print("[ssid:%d] Inject %d snapshot pods" % (ssid, index))
    for pod_yaml in iter_origin:
        if pod_yaml is None or len(pod_yaml) == 0:
            continue
        with open(outfile, 'a') as file:
            file.writelines(['\n---\n\n'])
            yaml.dump(pod_yaml, file)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="inject origin workload yaml into snapshot")
    parser.add_argument("origin", type=str, help="origin workload containing *pod*yaml")
    parser.add_argument("snapshot", type=str, help="snapshot folder containing pod-snapshot.yaml")
    args = parser.parse_args()
    inject_origin_workload_into_snapshot(args.origin, args.snapshot)
    """
    {
      "apiVersion": "v1",
      "kind": "Pod",
      "metadata":
        {
          "annotations":
            {
              "alibabacloud.com/assume-time": "1234567891011121314",
              "alibabacloud.com/creation-time": "1970-01-01T10:50:04+08:00",
              "alibabacloud.com/gpu-count": "1",
              "alibabacloud.com/gpu-index": "1",
              "alibabacloud.com/gpu-milli": "1000",
            },
          "creationTimestamp": None,
          "name": "openb-pod-0000",
          "namespace": "openb-gpu",
          "uid": "abcdefgh-ijkl-mnop-qrst-uvwxyz",
        },
      "spec":
        {
          "containers":
            [
              {
                "image": "tensorflow:latest",
                "imagePullPolicy": "Always",
                "name": "main",
                "resources":
                  { "limits": { "cpu": "8" }, "requests": { "cpu": "8" } },
                "terminationMessagePolicy": "FallbackToLogsOnError",
              },
            ],
          "dnsPolicy": "Default",
          "nodeSelector": { "kubernetes.io/hostname": "openb-node-0461" },
          "restartPolicy": "OnFailure",
          "schedulerName": "simon-scheduler",
        },
      "status": {},
    }
    """