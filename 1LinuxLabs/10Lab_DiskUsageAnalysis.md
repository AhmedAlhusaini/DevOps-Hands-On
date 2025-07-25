# 🧪 Lab: Disk Usage Analysis

## 📝 Task

> Monitor disk space and file sizes:
> - Check the disk space usage of all mounted filesystems  
> - Find the size of your home directory  
> - Identify the largest directories in your home folder  
> - Check how much space specific files are using  
> - Display information about your storage devices  

---

## ✅ Steps

1. Show disk usage for all mounted filesystems.  
2. Calculate total size of your home directory.  
3. List and sort the largest directories under your home folder.  
4. Determine space used by individual files of interest.  
5. Display storage device details and partition layout.  

---

## 💡 Bonus

- Study well @_@ 

---

## 💻 Command(s)

```bash

devops_ninja@Ahmed-Hossainy:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
none            7.8G     0  7.8G   0% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
none            7.8G  4.0K  7.8G   1% /mnt/wsl
drivers         261G  221G   40G  85% /usr/lib/wsl/drivers
/dev/sdd       1007G  3.5G  953G   1% /
none            7.8G   84K  7.8G   1% /mnt/wslg
none            7.8G     0  7.8G   0% /usr/lib/wsl/lib
rootfs          7.8G  2.7M  7.8G   1% /init
none            7.8G  852K  7.8G   1% /run
none            7.8G     0  7.8G   0% /run/lock
none            7.8G     0  7.8G   0% /run/shm
none            7.8G   76K  7.8G   1% /mnt/wslg/versions.txt
none            7.8G   76K  7.8G   1% /mnt/wslg/doc
C:\             261G  221G   40G  85% /mnt/c
D:\             531G  503G   29G  95% /mnt/d
E:\             140G   70G   71G  50% /mnt/e
snapfuse         67M   67M     0 100% /snap/core24/1006
snapfuse         67M   67M     0 100% /snap/core24/1055
snapfuse         11M   11M     0 100% /snap/htop/5021
snapfuse         11M   11M     0 100% /snap/htop/5092
snapfuse         51M   51M     0 100% /snap/snapd/24718
snapfuse         50M   50M     0 100% /snap/snapd/24792
tmpfs           7.8G   16K  7.8G   1% /run/user/1000




devops_ninja@Ahmed-Hossainy:/$ df -h /home/
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdd       1007G  3.5G  953G   1% /


devops_ninja@Ahmed-Hossainy:/$ du -sh ~
6.8M    /home/devops_ninja


devops_ninja@Ahmed-Hossainy:/$ du -sh /home/
6.9M    /home/

devops_ninja@Ahmed-Hossainy:/$ du -h ~ | sort -hr | head -n 5
6.8M    /home/devops_ninja
6.6M    /home/devops_ninja/.local/share/fish/generated_completions
6.6M    /home/devops_ninja/.local/share/fish
6.6M    /home/devops_ninja/.local/share
6.6M    /home/devops_ninja/.local


devops_ninja@Ahmed-Hossainy:/$ ls
bin                boot  etc   init  lib64              lost+found  mnt  proc  run   sbin.usr-is-merged  srv  tmp  var        wslGnoFLB  wslKnpCaE
bin.usr-is-merged  dev   home  lib   lib.usr-is-merged  media       opt  root  sbin  snap                sys  usr  wslGngmcE  wslkdjbdE  wslodEpbE
devops_ninja@Ahmed-Hossainy:/$ cd /home/ && ls
devops_ninja  error.txt  Hard-Soft-Link
devops_ninja@Ahmed-Hossainy:/home$ du -h error.txt
4.0K    error.txt


devops_ninja@Ahmed-Hossainy:/home$ lsblk
NAME
    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda   8:0    0 388.4M  1 disk
sdb   8:16   0   186M  1 disk
sdc   8:32   0     4G  0 disk [SWAP]
sdd   8:48   0     1T  0 disk /var/lib/docker
                              /snap
                              /mnt/wslg/distro
                              /





devops_ninja@Ahmed-Hossainy:/home$ sudo fdisk -l
Disk /dev/ram0: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram1: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram2: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram3: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram4: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram5: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram6: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram7: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram8: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram9: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram10: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram11: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram12: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram13: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram14: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/ram15: 4 MiB, 4194304 bytes, 8192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/sdb: 186.04 MiB, 195080192 bytes, 381016 sectors
Disk model: Virtual Disk
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sda: 388.45 MiB, 407314432 bytes, 795536 sectors
Disk model: Virtual Disk
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sdc: 4 GiB, 4294971392 bytes, 8388616 sectors
Disk model: Virtual Disk
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes


Disk /dev/sdd: 1 TiB, 1099511627776 bytes, 2147483648 sectors
Disk model: Virtual Disk
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
