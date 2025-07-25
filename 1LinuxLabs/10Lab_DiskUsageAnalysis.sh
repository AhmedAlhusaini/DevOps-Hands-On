#!/usr/bin/bash

df -h
df -h /home/
du -sh ~
du -sh /home/
du -h ~ | sort -hr | head -n 5
ls
cd /home/ && ls
du -h error.txt
lsblk
sudo fdisk -l
