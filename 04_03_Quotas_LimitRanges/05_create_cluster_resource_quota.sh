#!/bin/bash
set -x
directory=$(dirname $0)
echo "5. Creating cluster resource quota."
oc create -f $directory/04_cluster_resource_quota.yaml
