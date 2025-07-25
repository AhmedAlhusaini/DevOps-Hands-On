# 🧪 Lab: Network Exploration

## 📝 Task

> Test network connectivity and gather network information:
> - Test connectivity to `google.com`  
> - Display your network interface information and IP addresses  
> - Use `curl` or `wget` to download the homepage of a website  
> - Save the downloaded content to a file called `webpage.html`  

---

## ✅ Steps

1. Test reachability of `google.com` (e.g., with `ping`).  
2. Show your active network interfaces and their IP addresses.  
3. Fetch the homepage of a website using `curl` or `wget`.  
4. Redirect or save the output into `webpage.html`.  

---

## 💡 Bonus

- Use `traceroute` or `mtr` to diagnose the path packets take to a host.  
- Explore `dig` or `nslookup` to query DNS records for a domain.  
- Try `curl -I` to fetch HTTP headers only.  
- Senior tip: use `ip -br addr` for a concise interface summary.  
- Automate repeated pings with `ping -c 5 google.com` for a fixed count.  

---

## 💻 Command(s)

```bash
devops_ninja@Ahmed-Hossainy:~$ traceroute google.com
Command 'traceroute' not found, but can be installed with:
sudo apt install inetutils-traceroute  # version 2:2.4-3ubuntu1, or
sudo apt install traceroute            # version 1:2.1.5-1

devops_ninja@Ahmed-Hossainy:~$ traceroute google.com
traceroute to google.com (142.250.201.14), 30 hops max, 60 byte packets
 1  172.29.16.1 (172.29.16.1)  0.432 ms  0.407 ms  0.376 ms
 2  192.168.1.1 (192.168.1.1)  4.431 ms  3.960 ms  11.898 ms
 3  10.45.16.60 (10.45.16.60)  37.746 ms  45.201 ms  45.186 ms
 4  10.29.27.22 (10.29.27.22)  45.145 ms 10.29.27.18 (10.29.27.18)  45.114 ms 10.29.27.22 (10.29.27.22)  47.449 ms
 5  10.37.93.42 (10.37.93.42)  47.462 ms 10.36.14.206 (10.36.14.206)  64.113 ms  45.060 ms
 6  10.29.27.6 (10.29.27.6)  48.007 ms  50.349 ms  50.313 ms
 7  10.39.13.93 (10.39.13.93)  45.182 ms  37.819 ms 10.39.15.190 (10.39.15.190)  42.825 ms
 8  * 10.39.15.190 (10.39.15.190)  41.819 ms *
 9  193.251.247.98 (193.251.247.98)  231.893 ms *  231.849 ms
10  193.251.247.98 (193.251.247.98)  230.346 ms 81.52.188.109 (81.52.188.109)  188.031 ms 193.251.247.98 (193.251.247.98)  143.648 ms
11  81.52.188.109 (81.52.188.109)  187.985 ms 193.251.247.99 (193.251.247.99)  193.415 ms 193.251.131.44 (193.251.131.44)  193.839 ms
12  72.14.203.56 (72.14.203.56)  192.988 ms 193.251.131.44 (193.251.131.44)  188.215 ms  193.798 ms
13  192.178.105.209 (192.178.105.209)  192.645 ms 192.178.105.211 (192.178.105.211)  233.601 ms 193.251.255.170 (193.251.255.170)  233.539 ms
14  216.239.42.135 (216.239.42.135)  200.578 ms  232.764 ms 192.178.105.211 (192.178.105.211)  233.817 ms
15  14.201.250.142.in-addr.arpa (142.250.201.14)  233.751 ms 216.239.42.99 (216.239.42.99)  164.354 ms  164.248 ms



devops_ninja@Ahmed-Hossainy:~$ mtr --report google.com

devops_ninja@Ahmed-Hossainy:~$ mtr --report google.com
Start: 2025-07-25T02:15:54+0300
HOST: Ahmed-Hossainy              Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- 172.29.16.1                0.0%    10    0.8   0.8   0.5   1.4   0.3
  2.|-- 192.168.1.1                0.0%    10   49.9 631.5   3.5 2559. 836.1
  3.|-- 10.45.16.60                0.0%    10  342.9 826.3  71.8 2603. 776.3
  4.|-- 10.29.27.30                0.0%    10  284.7 770.4  39.8 2504. 755.4
  5.|-- 10.36.14.206               0.0%    10  222.0 710.3  46.4 2404. 738.2
  6.|-- 10.29.27.6                 0.0%    10  173.5 675.8  50.5 2304. 705.7
  7.|-- 10.39.13.93               10.0%    10  110.8 642.1  44.5 2152. 681.7
  8.|-- 10.39.15.174              10.0%    10   80.4 626.8  50.9 2168. 696.4
  9.|-- 10.45.28.77               20.0%    10   84.2 648.7  66.7 2067. 688.3
 10.|-- 193.251.247.98             0.0%    10  196.8 774.9 183.0 1969. 686.5
 11.|-- 193.251.247.99             0.0%    10  1428. 2517. 394.7 5905. 1755.1
 12.|-- 193.251.131.44             0.0%    10  1367. 2474. 332.7 5809. 1745.9
 13.|-- 72.14.197.198              0.0%    10   83.4 745.3  83.4 1788. 587.4
 14.|-- 192.178.105.211            0.0%    10  116.2 705.4 116.2 1688. 552.1
 15.|-- 216.239.42.135             0.0%    10   82.7 607.1  82.7 1542. 500.6
 16.|-- 14.201.250.142.in-addr.ar  0.0%     8   86.3 512.4  86.3 1554. 451.7


devops_ninja@Ahmed-Hossainy:~$ ping -c 5 google.com
devops_ninja@Ahmed-Hossainy:~$ ping google.com
PING google.com (142.250.201.14) 56(84) bytes of data.
64 bytes from 14.201.250.142.in-addr.arpa (142.250.201.14): icmp_seq=1 ttl=118 time=130 ms
64 bytes from 14.201.250.142.in-addr.arpa (142.250.201.14): icmp_seq=2 ttl=118 time=88.4 ms
64 bytes from 14.201.250.142.in-addr.arpa (142.250.201.14): icmp_seq=3 ttl=118 time=134 ms
^C
--- google.com ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2156ms
rtt min/avg/max/mdev = 88.352/117.298/134.013/20.549 ms


devops_ninja@Ahmed-Hossainy:~$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet 10.255.255.254/32 brd 10.255.255.254 scope global lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:15:5d:b2:a0:26 brd ff:ff:ff:ff:ff:ff
    inet 172.29.20.113/20 brd 172.29.31.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::215:5dff:feb2:a026/64 scope link
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether 02:42:9c:a7:fe:a5 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
# Modern ip command, detailed
ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet 10.255.255.254/32 brd 10.255.255.254 scope global lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:15:5d:b2:a0:26 brd ff:ff:ff:ff:ff:ff
    inet 172.29.20.113/20 brd 172.29.31.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::215:5dff:feb2:a026/64 scope link
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether 02:42:9c:a7:fe:a5 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
# Modern ip command, brief

devops_ninja@Ahmed-Hossainy:~$ ip -br addr
lo               UNKNOWN        127.0.0.1/8 10.255.255.254/32 ::1/128
eth0             UP             172.29.20.113/20 fe80::215:5dff:feb2:a026/64
docker0          DOWN           172.17.0.1/16


# Legacy ifconfig (may need apt install net-tools)

devops_ninja@Ahmed-Hossainy:~$ ifconfig -a
docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:9c:a7:fe:a5  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.29.20.113  netmask 255.255.240.0  broadcast 172.29.31.255
        inet6 fe80::215:5dff:feb2:a026  prefixlen 64  scopeid 0x20<link>
        ether 00:15:5d:b2:a0:26  txqueuelen 1000  (Ethernet)
        RX packets 993  bytes 636351 (636.3 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 607  bytes 81200 (81.2 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 35233  bytes 11170063 (11.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 35233  bytes 11170063 (11.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0


devops_ninja@Ahmed-Hossainy:~$ dig google.com
Command 'dig' not found, but can be installed with:
sudo apt install bind9-dnsutils

devops_ninja@Ahmed-Hossainy:~$ nslookup google.com
Command 'nslookup' not found, but can be installed with:
sudo apt install bind9-dnsutils
devops_ninja@Ahmed-Hossainy:~$ sudo apt install bind9-dnsutils
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  bind9-host bind9-libs liblmdb0 libmaxminddb0 libuv1t64
Suggested packages:
  mmdb-bin
The following NEW packages will be installed:
  bind9-dnsutils bind9-host bind9-libs liblmdb0 libmaxminddb0 libuv1t64
0 upgraded, 6 newly installed, 0 to remove and 23 not upgraded.
Need to get 1,629 kB of archives.
After this operation, 4,652 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu noble/main amd64 libuv1t64 amd64 1.48.0-1.1build1 [97.3 kB]


devops_ninja@Ahmed-Hossainy:~$ nslookup google.com
Server:         10.255.255.254
Address:        10.255.255.254#53

Non-authoritative answer:
Name:   google.com
Address: 142.250.201.14
Name:   google.com
Address: 2a00:1450:4006:80e::200e


# Using curl, save to file
curl http://gisoverflow.com -o webpage.html

# Using curl with silent mode and show errors
curl -sS http://gisoverflow.com -o webpage2.html

# Using wget, save to file
wget http://gisoverflow.com -O webpage3.html

# Using wget in background
wget -b http://gisoverflow.com -O webpage4.html



devops_ninja@Ahmed-Hossainy:~$ head webpage.html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Title -->
    <title>GIS Overflow | coming soon</title>

# Show HTTP headers only
curl -I http://gisoverflow.com

# Download only headers with wget
wget --spider --server-response http://gisoverflow.com