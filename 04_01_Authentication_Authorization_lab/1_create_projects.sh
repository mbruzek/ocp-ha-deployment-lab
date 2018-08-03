#!/bin/bash

echo "Create the projects for the portalapp"

oc login -u system:admin

export APPNAME=portalapp
export APPTEXT="Portal App"
oc new-project ${APPNAME}-dev --display-name="${APPTEXT} Development"
oc new-project ${APPNAME}-test --display-name="${APPTEXT} Testing"
oc new-project ${APPNAME}-prod --display-name="${APPTEXT} Production"

export APPNAME=paymentapp
export APPTEXT="Payment App"
oc new-project ${APPNAME}-dev --display-name="${APPTEXT} Development"
oc new-project ${APPNAME}-test --display-name="${APPTEXT} Testing"
oc new-project ${APPNAME}-prod --display-name="${APPTEXT} Production"
