#!/usr/bin/bash
ps a 
ps au
ps aux
ps aux | grep bash
ps aux | grep -v grep
ps aux | grep -i bash

bash 
sleep 300 &
exit
ps aux | grep sleep
killall sleep
ps aux | grep -i sleep

bash
sleep 300 &
exit
pgrep -f 'sleep 300'
ps aux | grep '[s]leep 300'
kill $(pgrep -f 'sleep 300') 

