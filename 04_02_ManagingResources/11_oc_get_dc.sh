#!/bin/bash
set -x
echo "Get the DeploymentConfiguration to see if the pods were scaled."

oc describe dc/hello-openshift
sleep 5
oc describe dc/hello-openshift

echo "Notice the scale up or scale down messages in the dc."
