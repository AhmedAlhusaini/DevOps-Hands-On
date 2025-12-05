#!/bin/bash

start_integer=9
ip4="53.0.35.${start_integer}/24"
for i in localhost node1 node2;
do
       ansible-playbook backup-network.yml -e "host=$i" -e "ip_v4=$ip4"
       start_integer=$((start_integer+1))
       ip4="53.0.35.${start_integer}/24"      
done;

