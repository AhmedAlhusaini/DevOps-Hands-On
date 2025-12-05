#!/bin/bash

for i in node1 node2;
do
	ansible $i -m setup -a 'filter=hostname' | grep 'hostname'
	ansible $i -m setup -a 'filter=bios_version' | grep -i 'bios'
	ansible $i -m setup -a 'filter="{{devices[0]}}"' | grep -i 'size'


done;
