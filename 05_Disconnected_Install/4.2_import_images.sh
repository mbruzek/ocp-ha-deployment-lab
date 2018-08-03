#!/bin/bash
set -x

echo "from bastion"

echo "4.2 Import all images from isolated1 to host the openshift integrated docker-registry service running on infra nodes"

oc import-image docker-registry.default.svc:5000/gogs:latest --from=isolated1.$GUID.internal:5000/wkulhanek/gogs:latest --confirm --insecure=true -n openshift

oc import-image docker-registry.default.svc:5000/sonatype/nexus3:latest --from=isolated1.$GUID.internal:5000/sonatype/nexus3:latest --confirm --insecure=true -n openshift

oc import-image docker-registry.default.svc:5000/rhscl/postgresql:latest --from=isolated1.$GUID.internal:5000/rhscl/postgresql-96-rhel7:latest --confirm --insecure=true -n openshift
oc tag postgresql:latest postgresql:9.6 -n openshift

oc import-image docker-registry.default.svc:5000/openshift/jboss-eap70-openshift:latest --from=isolated1.$GUID.internal:5000/jboss-eap-7/eap70-openshift:latest --confirm --insecure=true -n openshift
oc tag jboss-eap70-openshift:latest jboss-eap70-openshift:1.7 -n openshift
