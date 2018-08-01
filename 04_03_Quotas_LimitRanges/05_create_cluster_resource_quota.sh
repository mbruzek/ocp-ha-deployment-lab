#!/bin/bash
set -x
echo "5. Creating cluster resource quota."
oc create -f 04_cluster_resource_quota.yaml
