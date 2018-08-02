#!/bin/bash
set -x
RHT_TAG='v3.9'
LOCAL_TAG='latest'

# Latest tags point to older releases. Need to use version-specific tag::
IMAGES_MAJOR_LATEST="jenkins-2-rhel7 jenkins-slave-base-rhel7 jenkins-slave-maven-rhel7 jenkins-slave-nodejs-rhel7"
time for image in ${IMAGES_MAJOR_LATEST}
do
  latest_version=`skopeo inspect --tls-verify=false docker://registry.access.redhat.com/openshift3/$image | jq ".RepoTags | map(select(startswith((\"${RHT_TAG}\")))) |.[] "| sort -V | tail -1 | tr -d '"'`
  if [[ "$latest_version" == "" ]]; then latest_version='latest';fi
  echo "Copying image: $image version: $latest_version"
  skopeo copy --dest-tls-verify=false docker://registry.access.redhat.com/openshift3/${image}:${latest_version} docker://localhost:5000/openshift3/${image}:${LOCAL_TAG}
done
