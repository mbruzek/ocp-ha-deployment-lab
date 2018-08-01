#!/bin/bash
set -x
echo "12. Create a 3scale Admin Portal."
oc new-app --template=system --param WILDCARD_DOMAIN=apps.$GUID.example.opentlc.com
