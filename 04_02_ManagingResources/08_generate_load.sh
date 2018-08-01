#!/bin/bash
set -x
ROUTE=$(oc get route hello-openshift --template "{{ .spec.host }}")
for time in {1..15000}
  do
   echo time $time
   curl ${ROUTE}
  done
