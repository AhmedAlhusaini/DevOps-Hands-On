#!/usr/bin/bash
traceroute google.com
sudo apt install inetutils-traceroute
sudo apt install traceroute
mtr --report google.com
sudo apt install mtr
ping -c 5 google.com
ping google.com
ip addr
ip addr show
ip -br addr
ifconfig -a
dig google.com
nslookup google.com
sudo apt install bind9-dnsutils
nslookup google.com
curl http://gisoverflow.com -o webpage.html
curl -sS http://gisoverflow.com -o webpage2.html
wget http://gisoverflow.com -O webpage3.html
wget -b http://gisoverflow.com -O webpage4.html
head webpage.html
curl -I http://gisoverflow.com
wget --spider --server-response http://gisoverflow.com


