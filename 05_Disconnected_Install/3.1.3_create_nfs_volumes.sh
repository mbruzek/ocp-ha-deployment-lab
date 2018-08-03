#!/bin/sh

echo "Connect to the support server and create NFS exports to support applications."
mkdir -p /srv/nfs/user-vols/pv{1..200}

for pvnum in {1..200} ; do
echo /srv/nfs/user-vols/pv${pvnum} *(rw,root_squash) >> /etc/exports.d/openshift-uservols.exports
chown -R nfsnobody.nfsnobody  /srv/nfs
chmod -R 777 /srv/nfs
done

systemctl restart nfs-server
