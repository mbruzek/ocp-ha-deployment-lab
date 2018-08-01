#!/bin/bash
set -x
echo "Examine the HPA to see the effect of the workload."
oc get hpa/hello-openshift -n test-hpa
sleep 10
oc get hpa/hello-openshift -n test-hpa
sleep 10
oc get hpa/hello-openshift -n test-hpa
sleep 10
oc get hpa/hello-openshift -n test-hpa
echo "May have to run this script multiple times."
echo "The HPA does not scale up or down instantly."
