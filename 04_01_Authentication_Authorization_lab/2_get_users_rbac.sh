#!/bin/bash

oc get users

oc describe rolebinding.rbac -n paymentapp-dev
