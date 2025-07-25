#!/usr/bin/bash
# 1. Check current memory usage in human-readable format
free -h

# 1a. (Extra) Refresh memory usage every 2 seconds
watch -n 2 free -h

# 1b. (Extra) Show per-second virtual memory stats
vmstat 2

# 2. Display CPU architecture and features
lscpu

# 2a. (Extra) Show model name from /proc/cpuinfo
grep "model name" -m1 /proc/cpuinfo
cat /proc/cpuinfo 
# 2b. (Extra) Show number of CPUs
grep -c "processor" /proc/cpuinfo
# 2c. (Extra) Show CPU frequency
grep "MHz" /proc/cpuinfo
# 2d. (Extra) Show CPU cache sizes
grep "cache size" /proc/cpuinfo
# 2e. (Extra) Show CPU flags
grep "flags" /proc/cpuinfo
# 2f. (Extra) Show CPU topology
grep "core id" /proc/cpuinfo
# 2g. (Extra) Show CPU model and vendor
grep -E "model name|vendor_id" /proc/cpuinfo
# 2h. (Extra) Show CPU topology
grep "physical id" /proc/cpuinfo | sort -u
# 2i. (Extra) Show CPU cache hierarchy
grep -E "cache size|cache_alignment" /proc/cpuinfo
# 2j. (Extra) Show CPU flags
grep "flags" /proc/cpuinfo | sort -u
# 2k. (Extra) Show CPU features
grep "features" /proc/cpuinfo | sort -u
# 2l. (Extra) Show CPU model and family
grep -E "model|family" /proc/cpuinfo | sort -u
# 2m. (Extra) Show CPU stepping
grep "stepping" /proc/cpuinfo | sort -u
# 2n. (Extra) Show CPU cache line size
grep "cache_alignment" /proc/cpuinfo | sort -u
# 2o. (Extra) Show CPU microcode version
grep "microcode" /proc/cpuinfo | sort -u

# 3. Show system load averages (1, 5, 15 minutes)
cat /proc/loadavg

# 3a. (Extra) Watch load average in real time
watch -n 2 cat /proc/loadavg

# 4. Display disk space usage of all mounted filesystems
df -h
du -h --max-depth=1 /
# 4a. (Extra) Show disk space usage with filesystem types
df -hT
# 4b. (Extra) Show disk space usage with inode information
df -hi
# 4c. (Extra) Show disk space usage with human-readable sizes
df -h --total
# 4d. (Extra) Show disk space usage with filesystem types and inode information
df -hT -i
# 4e. (Extra) Show disk space usage with filesystem types and human-readable sizes
df -hT --total
# 4f. (Extra) Show disk space usage with filesystem types, inode information,
# and human-readable sizes
df -hT -i --total
# 4a. (Extra) Show only local filesystems (exclude tmpfs and devtmpfs)
df -hT -x tmpfs -x devtmpfs

# 5. List running processes sorted by descending memory usage, show top 10
ps aux --sort=-%mem | head -n 10
htop #Then Press M
# 5a. (Extra) Sort processes by CPU then memory usage
ps aux --sort=-%cpu,-%mem | head -n 10

