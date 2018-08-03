#!/bin/bash
set -x
RHT_TAG=v3.9.14
LOCAL_TAG=v3.9.14

IMAGES_SAME_PATCH="ose-ansible ose-cluster-capacity ose-deployer ose-docker-builder ose-docker-registry ose-egress-http-proxy ose-egress-router ose-haproxy-router ose-pod ose-sti-builder ose container-engine efs-provisioner node openvswitch oauth-proxy logging-auth-proxy logging-curator logging-elasticsearch logging-fluentd logging-kibana metrics-cassandra metrics-hawkular-metrics metrics-heapster oauth-proxy ose ose-service-catalog prometheus-alert-buffer prometheus-alertmanager prometheus registry-console ose-web-console ose-template-service-broker ose-ansible-service-broker logging-deployer metrics-deployer ose-service-catalog mediawiki-apb postgresql-apb mariadb-apb mysql-apb"

time for image in ${IMAGES_SAME_PATCH}
do
  latest_version=`skopeo inspect --tls-verify=false docker://registry.access.redhat.com/openshift3/$image | jq ".RepoTags | map(select(startswith((\"${RHT_TAG}\")))) |.[] "| sort -V | tail -1 | tr -d '"'`
  if [[ "$latest_version" == "" ]]; then latest_version='latest';fi
  echo "Copying image: $image version: $latest_version"
  skopeo copy --dest-tls-verify=false docker://registry.access.redhat.com/openshift3/${image}:${latest_version} docker://localhost:5000/openshift3/${image}:${LOCAL_TAG}
  echo "Copied image: $image version: $latest_version"
done
