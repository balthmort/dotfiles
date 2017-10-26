#!/bin/bash

#set -x

scp root@dactive.local.czechglobe.cz:/var/www/dhcp/files/conf/* /tmp/

inner_hosts=$(cat /tmp/20* | cut -d, -f1)
ovirt_hosts=$(cat /tmp/127* | cut -d, -f1)
mgmt_hosts=$(cat /tmp/128* | cut -d, -f1)

scp root@zdar.czechglobe.cz:/var/named/slaves/lep.hosts .

outer_hosts=$(grep "IN\s*A" lep.hosts | awk '{print $1}')

echo ": " $inner_hosts | sudo tee - /etc/cz
echo "z: " $outer_hosts " " | sudo tee -a - /etc/cz
echo "o: " $ovirt_hosts " " | sudo tee -a - /etc/cz
echo "m: " $mgmt_hosts " " | sudo tee -a - /etc/cz
