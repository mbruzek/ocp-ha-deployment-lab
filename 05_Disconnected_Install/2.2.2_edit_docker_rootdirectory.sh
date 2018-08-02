#!/bin/bash
set -x
echo "Edit /etc/docker-distribution/registry/config.yml "
sed -i 's/^.*rootdirectory.*$/        rootdirectory: \/srv\/repohost\/registry/' /etc/docker-distribution/registry/config.yml
