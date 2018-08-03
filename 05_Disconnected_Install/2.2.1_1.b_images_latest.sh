#!/bin/bash
set -x
# 7 minutes
RHT_TAG='latest'
LOCAL_TAG='v3.9.14'
IMAGES_LATEST_TO_PATCH="ose-recycler prometheus-node-exporter"

time for image in ${IMAGES_LATEST_TO_PATCH}
do
  latest_version=`skopeo inspect --tls-verify=false docker://registry.access.redhat.com/openshift3/$image | jq ".RepoTags | map(select(startswith((\"${RHT_TAG}\")))) |.[] "| sort -V | tail -1 | tr -d '"'`
  if [[ "$latest_version" == "" ]]; then latest_version='latest';fi
  echo "Copying image: $image version: $latest_version"
  skopeo copy --dest-tls-verify=false docker://registry.access.redhat.com/openshift3/${image}:${latest_version} docker://localhost:5000/openshift3/${image}:${LOCAL_TAG} &
done
