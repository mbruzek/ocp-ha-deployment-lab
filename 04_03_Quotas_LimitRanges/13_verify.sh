#!/bin/bash
set -x

echo "13. Verify that no pods were launched."
oc get pods -n 3scale

echo "14. Find out why."
oc get events | grep zync-database
