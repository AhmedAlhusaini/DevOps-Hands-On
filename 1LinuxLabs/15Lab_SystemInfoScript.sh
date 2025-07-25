#!/bin/bash

# 1. Get current date in YYYYMMDD format
currDate=$(date +%Y%m%d)

# 2. Greet the user with the date
echo -e "Hello, welcome to Backup! Now Time Is: $currDate\n"

# 3. Show who you are
echo -e "My Name Is $(whoami) — Your Copilot\n"

# 4. Show current directory
echo -e "You are now at $(pwd) — Be Careful\n"

# 5. Display memory & disk usage
echo -e "Memory & Disk Usage:\n$(df -h)\n"


# 6. Display system information
echo -e "System Information:\n$(uname -a)\n"
# 7. Display CPU information
echo -e "CPU Information:\n$(lscpu)\n"
# 8. Display network information
echo -e "Network Information:\n$(ip addr)\n"
# 9. Display current user information
echo -e "Current User Information:\n$(id)\n"
# 10. Display current running processes
echo -e "Current Running Processes:\n$(ps aux)\n"
# 11. Display system uptime
echo -e "System Uptime:\n$(uptime -p)\n"
# 12. Display last login information
echo -e "Last Login Information:\n$(last -a | head -n 10)\n"
# 13. Display system load averages
echo -e "System Load Averages:\n$(uptime | awk -F'load average:' '{ print $2 }')\n"
# 14. Display kernel version
echo -e "Kernel Version:\n$(uname -r)\n"	
# 15. Display system architecture
echo -e "System Architecture:\n$(uname -m)\n"
# 16. Display hostname
echo -e "Hostname:\n$(hostname)\n"
# 17. Display current shell
echo -e "Current Shell:\n$SHELL\n"	
# 18. Display environment variables
echo -e "Environment Variables:\n$(printenv)\n"
# 19. Display disk space usage
echo -e "Disk Space Usage:\n$(df -h)\n"
# 20. Display open files
echo -e "Open Files:\n$(lsof | head -n 10)\n"
# 21. Display system logs
echo -e "System Logs:\n$(dmesg | tail -n 20)\n"
# 22. Display installed packages
echo -e "Installed Packages:\n$(dpkg --get-selections | grep -v deinstall)\n"
# 23. Display active network connections
echo -e "Active Network Connections:\n$(ss -tuln)\n"	