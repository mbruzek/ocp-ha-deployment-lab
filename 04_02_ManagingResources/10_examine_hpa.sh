#!/bin/bash
set -x
echo "Examine the HPA to see the effect of the workload."
oc get hpa/hello-openshift -n test-hpa
sleep 5
oc get hpa/hello-openshift -n test-hpa
sleep 5
oc get hpa/hello-openshift -n test-hpa
sleep 5
oc get hpa/hello-openshift -n test-hpa
