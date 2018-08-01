#!/bin/bash
set -x

echo "6. View the cluster resource quota."
oc get clusterresourcequota

echo "7. Describe the cluster resource quota."
oc describe clusterresourcequota clusterquota-andrew
