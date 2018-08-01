#!/bin/bash
set -x
echo "Get the DeploymentConfiguration to see if the pods were scaled."

oc describe dc/hello-openshift
sleep 5
oc describe dc/hello-openshift
sleep 5
oc describe dc/hello-openshift
