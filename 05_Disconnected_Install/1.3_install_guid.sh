#!/bin/bash
set -x

sudo -i
ansible localhost,all -m shell -a 'export GUID=`hostname | cut -d"." -f2`; echo "export GUID=$GUID" >> $HOME/.bashrc'
