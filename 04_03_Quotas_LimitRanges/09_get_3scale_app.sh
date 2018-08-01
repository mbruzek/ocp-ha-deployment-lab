#!/bin/bash
set -x

echo "9. Download the 3scale AMP template, PVC and wildcard router."
wget https://raw.githubusercontent.com/3scale/3scale-amp-openshift-templates/2.1.0-GA/amp/amp.yml

echo "10. Download the APIcast template."
wget https://raw.githubusercontent.com/3scale/3scale-amp-openshift-templates/2.1.0-GA/apicast-gateway/apicast.yml

echo "11. Create the 3scale AMP template and APIcast template."
oc create -f amp.yml
oc create -f apicast.yml
