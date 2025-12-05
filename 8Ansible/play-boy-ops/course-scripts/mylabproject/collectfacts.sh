#!/bin/bash


for i in managednode1 managednode2 ;
do
	ansible $i -m setup -a 'filter=devices'> /home/admin/mylabproject/hostinfo/$i
	ansible $i -m setup -a 'filter=enp0s3'>> /home/admin/mylabproject/hostinfo/$i
done;

