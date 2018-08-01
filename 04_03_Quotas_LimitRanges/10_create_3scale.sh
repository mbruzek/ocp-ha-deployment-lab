#!/bin/bash
set -x

echo "10. Create the 3scale Admin portal."
oc new-app --template=system --param WILDCARD_DOMAIN=apps.$GUID.example.opentlc.com
