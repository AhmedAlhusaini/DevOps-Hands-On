# 🧪 Lab: User and Group Management

## 📝 Task

> Explore user account information:
> - Display information about your user account  
> - List all users on the system  
> - Show which groups you belong to  
> - Check the contents of the `/etc/passwd` file (first 10 lines)  
> - Display your shell history  

---

## ✅ Steps

1. Retrieve your UID, GID, and supplementary group IDs.  
2. Enumerate all system user accounts.  
3. Show the groups for your current user.  
4. View the first ten lines of `/etc/passwd`.  
5. Print your shell command history.  

---

## 💡 Bonus

- Examine `/etc/group` to see group definitions and members.  
- Use `lastlog -u $(whoami)` to see your last login.  
- For deeper user info, inspect `/etc/shadow` (requires sudo).  
- Study Well
- Study Well
- Study Well

---

## 💻 Command(s)

```bash
devops_ninja@Ahmed-Hossainy:~$ id
uid=1000(devops_ninja) gid=1000(devops_ninja) groups=1000(devops_ninja),0(root),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),100(users)
devops_ninja@Ahmed-Hossainy:~$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
_apt:x:42:65534::/nonexistent:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:998:998:systemd Network Management:/:/usr/sbin/nologin
systemd-timesync:x:996:996:systemd Time Synchronization:/:/usr/sbin/nologin
dhcpcd:x:100:65534:DHCP Client Daemon,,,:/usr/lib/dhcpcd:/bin/false
messagebus:x:101:101::/nonexistent:/usr/sbin/nologin
syslog:x:102:102::/nonexistent:/usr/sbin/nologin
systemd-resolve:x:991:991:systemd Resolver:/:/usr/sbin/nologin
uuidd:x:103:103::/run/uuidd:/usr/sbin/nologin
landscape:x:104:105::/var/lib/landscape:/usr/sbin/nologin
polkitd:x:990:990:User for polkitd:/:/usr/sbin/nologin
devops_ninja:x:1000:1000:,,,:/home/devops_ninja:/bin/bash
sshd:x:105:65534::/run/sshd:/usr/sbin/nologin
dnsmasq:x:999:65534:dnsmasq:/var/lib/misc:/usr/sbin/nologin
ahmed:x:1001:1001::/home/ahmed:/bin/bash
devops_ninja@Ahmed-Hossainy:~$ groups devops_ninja
devops_ninja : devops_ninja root adm cdrom sudo dip plugdev users
devops_ninja@Ahmed-Hossainy:~$ head -n 10 /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
devops_ninja@Ahmed-Hossainy:~$ history
    1  exit
    2  ls
    3  exit
    4  id -u devops_ninja
    5  wsl --list
