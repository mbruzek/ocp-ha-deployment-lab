#!/bin/bash
set -x
directory=$(dirname $0)
oc login -u system:admin
oc create -f $dirname/14_limitrange.yaml
echo ""
oc get limitrange
echo ""
oc describe limitrange
