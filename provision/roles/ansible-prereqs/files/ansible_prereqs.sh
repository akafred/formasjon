#!/bin/sh
#install ansible prereqs manually or all apt-based ansible commands will fail
if [ ! -f /root/.ansible_prereqs_installed ]; then
        apt-get -q update
        apt-get install -q --yes python python-apt python-pycurl sshpass
        touch /root/.ansible_prereqs_installed
        echo "CHANGE"
fi