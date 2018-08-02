#!/bin/bash


rpm -i https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
echo "To use EPEL you need to issue the yum makecache."
yum makecache
yum install -y docker-distribution skopeo jq
