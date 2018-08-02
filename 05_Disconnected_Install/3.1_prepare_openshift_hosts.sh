#!/bin/bash

echo "1. Make sure all masters and nodes have docker installed and running."
ansible nodes -mshell -a'systemctl status docker| grep Active'

echo "2. Make sure the yum repository configurations are populated."
ansible all -mshell -a'yum repolist -v| grep baseurl'
