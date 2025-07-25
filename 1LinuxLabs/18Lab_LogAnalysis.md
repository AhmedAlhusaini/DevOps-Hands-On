# 🧪 Lab: Log Analysis

## 📝 Task

> Learn to read and analyze system logs:
> - View the last 20 lines of system logs  
> - Search for specific error messages  
> - Display logs from today only  
> - Follow logs in real time for 30 seconds  

---

## ✅ Steps

1. Use a pager to show the last 20 lines of the system journal.  
2. Filter the journal for entries marked as “error.”  
3. Restrict output to today’s entries.  
4. Follow new log entries live for a fixed duration.  

---

## 💡 Bonus

- Combine filters: show only today’s errors (`journalctl -p err --since today`).  


---

## 💻 Command(s)

```bash
# 1. View the last 20 lines of the system journal


devops_ninja@Ahmed-Hossainy:~$ journalctl -n 20
Jul 25 14:29:06 Ahmed-Hossainy systemd-resolved[212]: Clock change detected. Flushing caches.
Jul 25 14:29:14 Ahmed-Hossainy systemd-resolved[212]: Clock change detected. Flushing caches.
Jul 25 14:29:53 Ahmed-Hossainy wsl-pro-service[245]: INFO Daemon: connecting to Windows Agent
Jul 25 14:29:53 Ahmed-Hossainy wsl-pro-service[245]: DEBUG Updated systemd status to "Connecting"
Jul 25 14:29:53 Ahmed-Hossainy wsl-pro-service[245]: WARNING Daemon: could not connect to Windows Agent: could not get address: could not read agent port file "/mnt/c/Users/ahmed.elhossainy/.ubuntupro/.add>
Jul 25 14:29:53 Ahmed-Hossainy wsl-pro-service[245]: INFO Reconnecting to Windows host in 60 seconds
Jul 25 14:29:53 Ahmed-Hossainy wsl-pro-service[245]: DEBUG Updated systemd status to "Not connected: waiting to retry"
Jul 25 14:29:54 Ahmed-Hossainy systemd-resolved[212]: Clock change detected. Flushing caches.
Jul 25 14:30:02 Ahmed-Hossainy systemd-resolved[212]: Clock change detected. Flushing caches.
Jul 25 14:30:53 Ahmed-Hossainy wsl-pro-service[245]: INFO Daemon: connecting to Windows Agent
Jul 25 14:30:53 Ahmed-Hossainy wsl-pro-service[245]: DEBUG Updated systemd status to "Connecting"
Jul 25 14:30:53 Ahmed-Hossainy wsl-pro-service[245]: WARNING Daemon: could not connect to Windows Agent: could not get address: could not read agent port file "/mnt/c/Users/ahmed.elhossainy/.ubuntupro/.add>
Jul 25 14:30:53 Ahmed-Hossainy wsl-pro-service[245]: INFO Reconnecting to Windows host in 60 seconds
Jul 25 14:30:53 Ahmed-Hossainy wsl-pro-service[245]: DEBUG Updated systemd status to "Not connected: waiting to retry"
Jul 25 14:31:43 Ahmed-Hossainy systemd-resolved[212]: Clock change detected. Flushing caches.
Jul 25 14:31:58 Ahmed-Hossainy wsl-pro-service[245]: INFO Daemon: connecting to Windows Agent
Jul 25 14:31:58 Ahmed-Hossainy wsl-pro-service[245]: DEBUG Updated systemd status to "Connecting"
Jul 25 14:31:58 Ahmed-Hossainy wsl-pro-service[245]: WARNING Daemon: could not connect to Windows Agent: could not get address: could not read agent port file "/mnt/c/Users/ahmed.elhossainy/.ubuntupro/.add>
Jul 25 14:31:58 Ahmed-Hossainy wsl-pro-service[245]: INFO Reconnecting to Windows host in 60 seconds
Jul 25 14:31:58 Ahmed-Hossainy wsl-pro-service[245]: DEBUG Updated systemd status to "Not connected: waiting to retry

# 2. Search for “error” entries in the journal

devops_ninja@Ahmed-Hossainy:~$ journalctl -p err
Jul 09 23:21:24 Ahmed-Hossainy kernel: PCI: Fatal: No config space access function found
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_is_feature_enabled: Ioctl failed: -22
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -2
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 09 23:21:24 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -2
Jul 09 23:21:30 Ahmed-Hossainy unknown: WSL (188) ERROR: CheckConnection: getaddrinfo() failed: -5
Jul 09 23:21:33 Ahmed-Hossainy unknown: WSL (2 - init-systemd(Ubuntu)) ERROR: WaitForBootProcess:3497: /sbin/init failed to start within 10000ms
Jul 09 23:21:33 Ahmed-Hossainy login[371]: PAM unable to dlopen(pam_lastlog.so): /usr/lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
Jul 09 23:21:33 Ahmed-Hossainy login[371]: PAM adding faulty module: pam_lastlog.so
-- Boot 89eaf3eb64304deeb323ae84baca336c --
Jul 11 19:57:01 Ahmed-Hossainy kernel: PCI: Fatal: No config space access function found
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_is_feature_enabled: Ioctl failed: -22
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -2
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -22
Jul 11 19:57:01 Ahmed-Hossainy kernel: misc dxg: dxgk: dxgkio_query_adapter_info: Ioctl failed: -2
Jul 11 19:57:06 Ahmed-Hossainy unknown: WSL (187) ERROR: CheckConnection: getaddrinfo() failed: -5


devops_ninja@Ahmed-Hossainy:~$ journalctl --system | grep -i "machine"
Jul 09 23:21:25 Ahmed-Hossainy systemd[1]: systemd-machine-id-commit.service - Commit a transient machine-id on disk was skipped because of an unmet condition check (ConditionPathIsMountPoint=/etc/machine-id).
Jul 09 23:21:26 Ahmed-Hossainy systemd[1]: ua-timer.timer - Ubuntu Pro Timer for running repeated jobs was skipped because of an unmet condition check (ConditionPathExists=/var/lib/ubuntu-advantage/private/machine-token.json).
Jul 09 23:21:30 Ahmed-Hossainy systemd[1]: ua-reboot-cmds.service - Ubuntu Pro reboot cmds was skipped because of an unmet condition check (ConditionPathExists=/var/lib/ubuntu-advantage/private/machine-token.json).
Jul 11 19:57:02 Ahmed-Hossainy systemd[1]: systemd-machine-id-commit.service - Commit a transient machine-id on disk was skipped because of an unmet condition check (ConditionPathIsMountPoint=/etc/machine-id).
Jul 11 19:57:04 Ahmed-Hossainy systemd[1]: ua-timer.timer - Ubuntu Pro Timer for running repeated jobs was skipped because of an unmet condition check (ConditionPathExists=/var/lib/ubuntu-advantage/private/machine-token.json).
Jul 11 19:57:05 Ahmed-Hossainy systemd[1]: ua-reboot-cmds.service - Ubuntu Pro reboot cmds was skipped because of an unmet condition check (ConditionPathExists=/var/lib/ubuntu-advantage/private/machine-token.json).
Jul 12 12:57:45 Ahmed-Hossainy systemd[1]: systemd-machine-id-commit.service - Commit a transient machine-id on disk was skipped because of an unmet condition check (ConditionPathIsMountPoint=/etc/machine-id).


# 3. Display logs from today only
devops_ninja@Ahmed-Hossainy:~$ journalctl --since yesterday
Jul 24 11:11:04 Ahmed-Hossainy kernel: Linux version 6.6.87.2-microsoft-standard-WSL2 (root@439a258ad544) (gcc (GCC) 11.2.0, GNU ld (GNU Binutils) 2.37) #1 SMP PREEMPT_DYNAMIC Thu Jun  5 18:30:46 UTC 2025
Jul 24 11:11:04 Ahmed-Hossainy kernel: Command line: initrd=\initrd.img WSL_ROOT_INIT=1 panic=-1 nr_cpus=8 hv_utils.timesync_implicit=1 console=hvc0 debug pty.legacy_count=0 WSL_ENABLE_CRASH_DUMP=1
Jul 24 11:11:04 Ahmed-Hossainy kernel: KERNEL supported cpus:
Jul 24 11:11:04 Ahmed-Hossainy kernel:   Intel GenuineIntel
Jul 24 11:11:04 Ahmed-Hossainy kernel:   AMD AuthenticAMD
Jul 24 11:11:04 Ahmed-Hossainy kernel: BIOS-provided physical RAM map:
Jul 24 11:11:04 Ahmed-Hossainy kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
Jul 24 11:11:04 Ahmed-Hossainy kernel: BIOS-e820: [mem 0x00000000000e0000-0x00000000000e0fff] reserved
Jul 24 11:11:04 Ahmed-Hossainy kernel: BIOS-e820: [mem 0x0000000000100000-0x00000000001fffff] ACPI data
Jul 24 11:11:04 Ahmed-Hossainy kernel: BIOS-e820: [mem 0x0000000000200000-0x00000000f7ffffff] usable
Jul 24 11:11:04 Ahmed-Hossainy kernel: BIOS-e820: [mem 0x0000000100000000-0x0000000402ffffff] usable
Jul 24 11:11:04 Ahmed-Hossainy kernel: NX (Execute Disable) protection: active
Jul 24 11:11:04 Ahmed-Hossainy kernel: APIC: Static calls initialized

devops_ninja@Ahmed-Hossainy:~$ journalctl --since today
Jul 25 01:03:20 Ahmed-Hossainy kernel: Linux version 6.6.87.2-microsoft-standard-WSL2 (root@439a258ad544) (gcc (GCC) 11.2.0, GNU ld (GNU Binutils) 2.37) #1 SMP PREEMPT_DYNAMIC Thu Jun  5 18:30:46 UTC 2025
Jul 25 01:03:20 Ahmed-Hossainy kernel: Command line: initrd=\initrd.img WSL_ROOT_INIT=1 panic=-1 nr_cpus=8 hv_utils.timesync_implicit=1 console=hvc0 debug pty.legacy_count=0 WSL_ENABLE_CRASH_DUMP=1
Jul 25 01:03:20 Ahmed-Hossainy kernel: KERNEL supported cpus:
Jul 25 01:03:20 Ahmed-Hossainy kernel:   Intel GenuineIntel
Jul 25 01:03:20 Ahmed-Hossainy kernel:   AMD AuthenticAMD
Jul 25 01:03:20 Ahmed-Hossainy kernel: BIOS-provided physical RAM map:
Jul 25 01:03:20 Ahmed-Hossainy kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
Jul 25 01:03:20 Ahmed-Hossainy kernel: BIOS-e820: [mem 0x00000000000e0000-0x00000000000e0fff] reserved
Jul 25 01:03:20 Ahmed-Hossainy kernel: BIOS-e820: [mem 0x0000000000100000-0x00000000001fffff] ACPI data
Jul 25 01:03:20 Ahmed-Hossainy kernel: BIOS-e820: [mem 0x0000000000200000-0x00000000f7ffffff] usable
Jul 25 01:03:20 Ahmed-Hossainy kernel: BIOS-e820: [mem 0x0000000100000000-0x0000000402ffffff] usable
Jul 25 01:03:20 Ahmed-Hossainy kernel: NX (Execute Disable) protection: active
Jul 25 01:03:20 Ahmed-Hossainy kernel: APIC: Static calls initialized
Jul 25 01:03:20 Ahmed-Hossainy kernel: DMI not present or invalid.
Jul 25 01:03:20 Ahmed-Hossainy kernel: Hypervisor detected: Microsoft Hyper-V



# 4. Follow logs in real time for 30 seconds
devops_ninja@Ahmed-Hossainy:~$ timeout 30 journalctl -f
Jul 25 14:41:47 Ahmed-Hossainy wsl-pro-service[245]: INFO Reconnecting to Windows host in 60 seconds
Jul 25 14:41:47 Ahmed-Hossainy wsl-pro-service[245]: DEBUG Updated systemd status to "Not connected: waiting to retry"
Jul 25 14:42:06 Ahmed-Hossainy kernel: mini_init (169): drop_caches: 1
Jul 25 14:42:15 Ahmed-Hossainy systemd-resolved[212]: Clock change detected. Flushing caches.
Jul 25 14:42:50 Ahmed-Hossainy systemd-resolved[212]: Clock change detected. Flushing caches.
Jul 25 14:42:52 Ahmed-Hossainy wsl-pro-service[245]: INFO Daemon: connecting to Windows Agent
Jul 25 14:42:52 Ahmed-Hossainy wsl-pro-service[245]: DEBUG Updated systemd status to "Connecting"
Jul 25 14:42:52 Ahmed-Hossainy wsl-pro-service[245]: WARNING Daemon: could not connect to Windows Agent: could not get address: could not read agent port file "/mnt/c/Users/ahmed.elhossainy/.ubuntupro/.address": open /mnt/c/Users/ahmed.elhossainy/.ubuntupro/.address: no such file or directory
Jul 25 14:42:52 Ahmed-Hossainy wsl-pro-service[245]: INFO Reconnecting to Windows host in 60 seconds
Jul 25 14:42:52 Ahmed-Hossainy wsl-pro-service[245]: DEBUG Updated systemd status to "Not connected: waiting to retry"


