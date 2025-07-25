#!/usr/bin/bash
ubuntu@UbuntUmachine:/home$ pwd
/home/ubuntu
ubuntu@UbuntUmachine:/home$ ls -l
total 4
drwxr-xr-x 2 ubuntu ubuntu 4096 Oct  1 12:00 1LinuxLabs
ubuntu@UbuntUmachine:/home$ ls -ial
ubuntu@UbuntUmachine:/home$ ls -lah 
ubuntu@UbuntUmachine:/home$ ls
ubuntu@UbuntUmachine:/home$ ll
ubuntu@UbuntUmachine:/home$ cd 1LinuxLabs/
ubuntu@UbuntUmachine:/home/1LinuxLabs$ cd /
ubuntu@UbuntUmachine:/home/1LinuxLabs$ tree
ubuntu@UbuntUmachine:/$ cd home/
ubuntu@UbuntUmachine:/home$ cd ~ 
ubuntu@UbuntUmachine:/home$ cd /
ubuntu@UbuntUmachine:/$  tree >> linuxSystemFiles.


##Bouns 
# Start in your home
ubuntu@UbuntUmachine:/$ cd ~

# Go to /etc/ssh, saving ~
ubuntu@UbuntUmachine:/$ pushd /etc/ssh
ubuntu@UbuntUmachine:/$ dirs -v
# 0  /etc/ssh
# 1  /home/ahmed

# Go to /var/log, saving /etc/ssh
ubuntu@UbuntUmachine:/$ pushd /var/log
dirs -v
# 0  /var/log
# 1  /etc/ssh
# 2  /home/ahmed

# Jump back to /etc/ssh by its index 1
ubuntu@UbuntUmachine:/$ pushd +1
dirs -v
# 0  /etc/ssh
# 1  /home/ahmed
# 2  /var/log

# Pop back to /home/ahmed
ubuntu@UbuntUmachine:/$ popd
dirs -v
# 0  /home/ahmed
# 1  /var/log
