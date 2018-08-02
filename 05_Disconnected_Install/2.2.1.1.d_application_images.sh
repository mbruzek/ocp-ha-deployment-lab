#!/bin/bash
set -x
# Nexus and Gogs (latest) from docker.io
for image in sonatype/nexus3 wkulhanek/gogs
do
  skopeo copy --dest-tls-verify=false docker://docker.io/${image}:latest docker://localhost:5000/${image}:latest
done

# from registry.access.redhat.com
for image in rhel7/etcd rhscl/postgresql-96-rhel7 jboss-eap-7/eap70-openshift
do
  skopeo copy --dest-tls-verify=false docker://registry.access.redhat.com/$image:latest docker://localhost:5000/${image}:latest
done
