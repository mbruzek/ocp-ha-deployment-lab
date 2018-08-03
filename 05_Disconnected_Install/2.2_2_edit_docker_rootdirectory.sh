#!/bin/bash
set -x
echo "2.2.2 Edit /etc/docker-distribution/registry/config.yml "
sed -i 's/^.*rootdirectory.*$/        rootdirectory: \/srv\/repohost\/registry/' /etc/docker-distribution/registry/config.yml
echo "2.2.3 Enable logging to journalctl"
cat << EOF >> /etc/docker-distribution/registry/config.yml
log:
  accesslog:
    disabled: false
  level: info
  formatter: text
  fields:
    service: registry
    environment: staging
EOF
echo "2.2.4 Create directory to hold images."
mkdir -p /srv/repohost/registry
systemctl enable docker-distribution
systemctl start docker-distribution
systemctl status docker-distribution
