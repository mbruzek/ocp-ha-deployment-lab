#!/bin/bash
set -x
echo "5. Creating cluster resource quota."
oc create -f 04_cluster_resource_quota.yaml

echo "6. View the cluster resource quota."
oc get clusterresourcequota

echo "7. Describe the cluster resource quota."
oc describe clusterresourcequota clusterquota-andrew
