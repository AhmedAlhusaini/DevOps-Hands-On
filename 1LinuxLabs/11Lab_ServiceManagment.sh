#!/usr/bin/bash
# 1. Check service status
systemctl status ssh
systemctl status cron

# 2. View recent system logs
journalctl -xe

# 3. Filter logs for errors
journalctl -p err -b

# 4. List services enabled at boot
systemctl list-unit-files --type=service --state=enabled