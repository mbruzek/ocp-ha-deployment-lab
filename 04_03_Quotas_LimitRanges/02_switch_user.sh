#!/bin/bash
set -x

echo "3. Create a new project for 3scale API managment."
oc new-project 3scale
echo "4. Switch to system:admin user to set quota on user andrew."
oc login -u system:admin
