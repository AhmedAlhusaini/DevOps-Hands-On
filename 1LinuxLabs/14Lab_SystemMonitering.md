# 🧪 Lab: System Monitoring

## 📝 Task

> Monitor system resources and performance:
> - Check current memory usage  
> - Display CPU information  
> - Monitor system load average  
> - Check available disk space on all mounted filesystems  
> - Display running processes sorted by memory usage  

---

## ✅ Steps

1. Show your system’s RAM and swap usage.  
2. Retrieve detailed CPU architecture and feature info.  
3. View the load average over the past 1, 5, and 15 minutes.  
4. Display human-readable disk usage for every mounted filesystem.  
5. List all running processes, sorted by highest memory consumption.  

---

## 💡 Bonus

- Install and use `htop` for an interactive, colorized view of CPU, memory, and processes.  
- Use `vmstat 2` to sample system performance every 2 seconds.  

---

## 💻 Command(s)
```
```
## 1. Check Current Memory Usage

```bash
free -h
````

* **What it does**
  Displays total, used, and free memory (RAM and swap) in human-readable units (MiB/GiB).

* **Why**
  Knowing how much RAM is used vs. free helps you spot memory leaks, application bloat, or the need for more swap space.

* **Example output**

  ```
               total        used        free      shared  buff/cache   available
  Mem:           7.8G        2.1G        1.2G        150M        4.5G        5.2G
  Swap:         2.0G          0B        2.0G
  ```

* **Extra tasks**

  * Run `watch -n 2 free -h` to refresh every 2 seconds.
  * Install and try `vmstat 2` for per-second breakdowns.

---

## 2. Display CPU Information

```bash
lscpu
```

* **What it does**
  Prints CPU architecture, number of cores, threads, model name, speed, cache sizes, and virtualization support.

* **Why**
  Useful for capacity planning (cores vs. threads), optimizing multi-threaded workloads, or confirming hardware specs.

* **Example output snippet**

  ```
  Architecture:        x86_64
  CPU(s):              4
  Thread(s) per core:  2
  Core(s) per socket:  2
  Model name:          Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
  CPU MHz:             1800.000
  ```

* **Extra tasks**

  * View `/proc/cpuinfo` directly: `grep "model name" -m1 /proc/cpuinfo`.
  * Compare single-thread vs. multi-thread performance via `taskset`.

---

## 3. Monitor System Load Average

```bash
cat /proc/loadavg
```

* **What it does**
  Shows the system’s load averages (1, 5, and 15 minutes), plus running/runnable task counts.

* **Why**
  Load average indicates overall CPU demand. Values close to or above your core count may mean CPU contention.

* **Example output**

  ```
  0.25 0.10 0.05 1/125 2004
  ```

  * `0.25`, `0.10`, `0.05`: load averages
  * `1/125`: running vs. total threads
  * `2004`: most recent PID created

* **Extra tasks**

  * Watch in real time: `watch -n 2 cat /proc/loadavg`.
  * Understand load vs. CPU count: on a 4-core machine, load >4 means fully saturated.

---

## 4. Check Available Disk Space on All Mounted Filesystems

```bash
df -h
```

* **What it does**
  Lists each mounted filesystem’s total size, used, available space, and mount point.

* **Why**
  Prevents surprise “disk full” errors; essential before installing software or writing large logs.

* **Example output snippet**

  ```
  Filesystem      Size  Used Avail Use% Mounted on
  /dev/sda1        50G   12G   35G  26% /
  tmpfs           2.0G  150M  1.9G   8% /run
  ```

* **Extra tasks**

  * List only local filesystems: `df -hT -x tmpfs -x devtmpfs`.
  * Combine with `du` to drill down into large directories.

---

## 5. Display Running Processes Sorted by Memory Usage

```bash
ps aux --sort=-%mem | head -n 10
```

* **What it does**
  Shows all processes (`ps aux`), sorts them by descending memory consumption (`--sort=-%mem`), and displays the top 10.

* **Why**
  Quickly identifies memory-hungry processes that may need tuning or restarting.

* **Example output snippet**

  ```
  USER       PID %MEM %CPU COMMAND
  ubuntu    2045 12.3  2.1 /usr/bin/chrome
  root      1532  8.7  0.3 /usr/lib/mysql
  ...
  ```

* **Extra tasks**

  * Use `htop` and press `M` to sort by memory interactively.
  * Combine with CPU sort: `ps aux --sort=-%cpu,-%mem`.

