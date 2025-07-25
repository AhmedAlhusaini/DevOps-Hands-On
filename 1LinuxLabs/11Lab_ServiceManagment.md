# 🧪 Lab: Service Management

## 📝 Task

> Practice managing system services:
> - Check the status of a system service (e.g., `ssh` or `cron`)  
> - View recent system logs  
> - Look for any error messages in the logs  
> - Check which services are enabled to start at boot  

---

## ✅ Steps

1. Check the status of your chosen service.  
2. View the most recent entries in the system journal.  
3. Filter the journal for error-level messages.  
4. List all services enabled to start on boot.  

---

## 💡 Bonus

- Use `systemctl is-active <service>` to get a simple “active”/“inactive” result.  
- View logs for a single service: `journalctl -u <service>` (add `-n 20` for the last 20 lines).  
- Check a service’s unit file locations with `systemctl cat <service>`.  

---

## 💻 Command(s)

```bash

devops_ninja@Ahmed-Hossainy:/home$ systemctl status ssh
○ ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/usr/lib/systemd/system/ssh.service; disabled; preset: enabled)
     Active: inactive (dead)
TriggeredBy: ● ssh.socket
       Docs: man:sshd(8)
             man:sshd_config(5)
devops_ninja@Ahmed-Hossainy:/home$ systemctl status cron
● cron.service - Regular background program processing daemon
     Loaded: loaded (/usr/lib/systemd/system/cron.service; enabled; preset: enabled)
     Active: active (running) since Fri 2025-07-25 01:45:49 EEST; 58min ago
       Docs: man:cron(8)
   Main PID: 230 (cron)
      Tasks: 1 (limit: 19085)
     Memory: 1.0M (peak: 2.8M)
        CPU: 112ms
     CGroup: /system.slice/cron.service
             └─230 /usr/sbin/cron -f -P

Jul 25 02:15:04 Ahmed-Hossainy CRON[21034]: pam_unix(cron:session): session closed for user root
Jul 25 02:17:07 Ahmed-Hossainy CRON[22501]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
Jul 25 02:17:07 Ahmed-Hossainy CRON[22502]: (root) CMD (cd / && run-parts --report /etc/cron.hourly)
Jul 25 02:17:07 Ahmed-Hossainy CRON[22501]: pam_unix(cron:session): session closed for user root
Jul 25 02:25:04 Ahmed-Hossainy CRON[28021]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
Jul 25 02:25:04 Ahmed-Hossainy CRON[28022]: (root) CMD (command -v debian-sa1 > /dev/null && debian-sa1 1 1)
Jul 25 02:25:04 Ahmed-Hossainy CRON[28021]: pam_unix(cron:session): session closed for user root
Jul 25 02:35:07 Ahmed-Hossainy CRON[34622]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
Jul 25 02:35:07 Ahmed-Hossainy CRON[34623]: (root) CMD (command -v debian-sa1 > /dev/null && debian-sa1 1 1)
Jul 25 02:35:07 Ahmed-Hossainy CRON[34622]: pam_unix(cron:session): session closed for user root


devops_ninja@Ahmed-Hossainy:/home$ journalctl -xe
Jul 25 02:36:15 Ahmed-Hossainy systemd-resolved[209]: Clock change detected. Flushing caches.
Jul 25 02:36:21 Ahmed-Hossainy wsl-pro-service[242]: INFO Daemon: connecting to Windows Agent
Jul 25 02:36:21 Ahmed-Hossainy wsl-pro-service[242]: DEBUG Updated systemd status to "Connecting"

devops_ninja@Ahmed-Hossainy:/home$ journalctl -p err -b
Jul 25 01:45:48 Ahmed-Hossainy kernel: PCI: Fatal: No config space access function found
Jul 25 01:45:48 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_is_feature_enabled: Ioctl failed: -22
Jul 25 01:53:36 Ahmed-Hossainy unknown: WSL (188) ERROR: CheckConnection: getaddrinfo() failed: -5
Jul 25 01:56:34 Ahmed-Hossainy unknown: WSL (188) ERROR: CheckConnection: getaddrinfo() failed: -5


devops_ninja@Ahmed-Hossainy:/home$ systemctl list-unit-files --type=service --state=enabled
UNIT FILE                              STATE   PRESET
apparmor.service                       enabled enabled
apport.service                         enabled enabled
cloud-config.service                   enabled enabled
cloud-final.service                    enabled enabled
cloud-init-local.service               enabled enabled
cloud-init.service                     enabled enabled
console-setup.service                  enabled enabled
containerd.service                     enabled enabled
cron.service                           enabled enabled
dmesg.service                          enabled enabled
docker.service                         enabled enabled
e2scrub_reap.service                   enabled enabled
fail2ban.service                       enabled enabled
getty@.service                         enabled enabled
keyboard-setup.service                 enabled enabled
landscape-client.service               enabled enabled
networkd-dispatcher.service            enabled enabled
rsyslog.service                        enabled enabled
setvtrgb.service                       enabled enabled
snapd.apparmor.service                 enabled enabled
snapd.autoimport.service               enabled enabled
snapd.core-fixup.service               enabled enabled
snapd.recovery-chooser-trigger.service enabled enabled
snapd.seeded.service                   enabled enabled
snapd.service                          enabled enabled
snapd.system-shutdown.service          enabled enabled
systemd-pstore.service                 enabled enabled
systemd-resolved.service               enabled enabled
systemd-timesyncd.service              enabled enabled
ua-reboot-cmds.service                 enabled enabled
ubuntu-advantage.service               enabled enabled
ubuntu-fan.service                     enabled enabled
ufw.service                            enabled enabled
unattended-upgrades.service            enabled enabled
wsl-pro.service                        enabled enabled

35 unit files listed.
