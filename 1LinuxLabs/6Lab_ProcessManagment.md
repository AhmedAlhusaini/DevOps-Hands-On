# 🧪 Lab: Process Management

## 📝 Task

> Practice monitoring and managing processes:
> - Display all currently running processes  
> - Open a new terminal or start a long-running command (e.g., `sleep 300`)  
> - Find the process ID (PID) of your `sleep` command  
> - Kill the `sleep` process using its PID  
> - Use `top` or `htop` to monitor system processes in real time  

---

## ✅ Steps

1. List all running processes.  
2. In another terminal (or background), start a long-running task: `sleep 300`.  
3. Locate the PID of that sleep command.  
4. Terminate the sleep process by its PID.  
5. Launch `top` (or `htop`) to observe active processes and resource usage.  

---

## 💡 Bonus

- Use `pgrep` to directly fetch the PID by name: `pgrep sleep`.  
- Try `pkill sleep` to kill by process name instead of PID.  
- Explore `ps aux --sort=-%cpu` to see top CPU consumers.  
- Senior tip: use `nice`/`renice` to adjust process priority on the fly.  
- Combine `watch` with `ps` for a lightweight real-time view: `watch -n 2 'ps -eo pid,cmd,%mem,%cpu --sort=-%cpu'`.  

---

## 💻 Command(s)

```bash
ubuntu@UbuntUmachine:~$ ps aux
ubuntu@UbuntUmachine:~$ bash
ubuntu@UbuntUmachine:~$ exit
exit
ubuntu@UbuntUmachine:~$ bash
ubuntu@UbuntUmachine:~$ sleep 300 &
[1] 89954
ubuntu@UbuntUmachine:~$ exit
exit
ubuntu@UbuntUmachine:~$ ps a
ubuntu@UbuntUmachine:~$ ps au
ubuntu@UbuntUmachine:~$ ps aux
ubuntu@UbuntUmachine:~$ ps aux | sleep
sleep: missing operand
Try 'sleep --help' for more information.
ubuntu@UbuntUmachine:~$ ps aux | grep  sleep
ubuntu     71058  0.1  0.3   7740  3456 ?        Ss   17:18   0:03 bash -c while true; do sleep 1;head -v -n 8 /proc/meminfo; head -v -n 2 /proc/stat /proc/version /proc/uptime /proc/loadavg /proc/sys/fs/file-nr /proc/sys/kernel/hostname; tail -v -n 32 /proc/net/dev;echo '==> /proc/df <==';df -l;echo '==> /proc/who <==';who;echo '==> /proc/end <==';echo '##Moba##'; done
ubuntu     89954  0.0  0.1   6112  1792 pts/0    S    18:10   0:00 sleep 300
ubuntu     90457  0.0  0.1   6112  1792 ?        S    18:12   0:00 sleep 1
ubuntu     90459  0.0  0.2   7076  2048 pts/0    S+   18:12   0:00 grep --color=auto sleep
ubuntu@UbuntUmachine:~$ pgrep -f 'sleep 300'
89954
ubuntu@UbuntUmachine:~$ pgrep -f 'sleep 300'
ubuntu@UbuntUmachine:~$ kill < pgrep -f 'sleep 300'
bash: pgrep: No such file or directory
ubuntu@UbuntUmachine:~$ kill 89954



ubuntu@UbuntUmachine:~$ bash
ubuntu@UbuntUmachine:~$ sleep 300 &
[1] 92980
ubuntu@UbuntUmachine:~$ exit
exit
ubuntu@UbuntUmachine:~$ kill sleep
bash: kill: sleep: arguments must be process or job IDs
ubuntu@UbuntUmachine:~$ killall sleep
ubuntu@UbuntUmachine:~$ ps aux | grep -i sleep
ubuntu     71058  0.1  0.3   7740  3456 ?        Ss   17:18   0:04 bash -c while true; do sleep 1;head -v -n 8 /proc/meminfo; head -v -n 2 /proc/stat /proc/version /proc/uptime /proc/loadavg /proc/sys/fs/file-nr /proc/sys/kernel/hostname; tail -v -n 32 /proc/net/dev;echo '==> /proc/df <==';df -l;echo '==> /proc/who <==';who;echo '==> /proc/end <==';echo '##Moba##'; done
ubuntu     93359  0.0  0.1   6112  1792 ?        S    18:20   0:00 sleep 1
ubuntu     93361  0.0  0.2   6944  2176 pts/0    S+   18:20   0:00 grep --color=auto -i sleep
ubuntu@UbuntUmachine:~$ bash
ubuntu@UbuntUmachine:~$ sleep 300 &
[1] 93561
ubuntu@UbuntUmachine:~$ exit
exit
ubuntu@UbuntUmachine:~$ ps aux | grep -i sleep
ubuntu     71058  0.1  0.3   7740  3456 ?        Ss   17:18   0:04 bash -c while true; do sleep 1;head -v -n 8 /proc/meminfo; head -v -n 2 /proc/stat /proc/version /proc/uptime /proc/loadavg /proc/sys/fs/file-nr /proc/sys/kernel/hostname; tail -v -n 32 /proc/net/dev;echo '==> /proc/df <==';df -l;echo '==> /proc/who <==';who;echo '==> /proc/end <==';echo '##Moba##'; done
ubuntu     93561  0.0  0.1   6112  1792 pts/0    S    18:20   0:00 sleep 300
ubuntu     93603  0.0  0.1   6112  1792 ?        S    18:20   0:00 sleep 1
ubuntu     93605  0.0  0.2   6944  2176 pts/0    S+   18:20   0:00 grep --color=auto -i sleep
ubuntu@UbuntUmachine:~$ pgrep -f 'sleep 300'
93561
ubuntu@UbuntUmachine:~$ kill $(pgrep -f 'sleep 300')
ubuntu@UbuntUmachine:~$ pgrep -f 'sleep 300'

```

## 💡 AI Explaination


## 1. List all running processes

Use `ps aux` to get a full snapshot of every process on the system:

```bash
ps aux
````

* **What it does**

  * `ps` (“process status”) reads the kernel’s process table (via `/proc` on Linux)
  * `a` shows processes for all users
  * `u` adds user-oriented columns (UID, %CPU, %MEM, etc.)
  * `x` includes processes without a controlling terminal

* **Why**
  You need to see every process and its basic resource usage to understand what’s running.

---

## 2. Start a long-running command in the background

Run a dummy process with `sleep 300 &` so you can practice finding and killing it:

```bash
sleep 300 &
```

* **What it does**

  * `sleep 300` creates a process that does nothing for 300 seconds
  * The trailing `&` sends the job to the background, keeping your shell free

* **Why**
  A backgrounded `sleep` process gives you a predictable target for later steps.

* **Under the hood**
  The shell forks itself, the child execs `/bin/sleep`, and the kernel tracks its PID and state.

---

## 3. Find the PID of your `sleep` command

### Option A: Using `ps` + `grep`

```bash
ps aux | grep '[s]leep 300'
```

* The regex `[s]leep` prevents `grep` from matching its own process.

### Option B: Using `pgrep`

```bash
pgrep -f 'sleep 300'
```

* `-f` matches the full command line.

**Why**
You must identify the exact PID before sending a signal to terminate the process.

---

## 4. Kill the `sleep` process

Send a SIGTERM to politely request shutdown:

```bash
kill <PID>
```

* **What it does**
  Sends signal 15 (SIGTERM) to `<PID>`, allowing the process to clean up.

* **Why**
  SIGTERM gives the process a chance to exit gracefully. Use `kill -9` (SIGKILL) only if it ignores SIGTERM.

* **Under the hood**
  `kill` invokes a system call; the kernel delivers the signal, and the process’s default handler stops it.

---

## 5. Monitor processes in real time

Use `top` or `htop` for a dynamic view:

```bash
top
```

or, if installed:

```bash
htop
```

* **What you see**

  * Live, updating list of processes
  * CPU and memory usage, process hierarchy (in `htop`), and color highlighting

* **Why**
  Essential for spotting runaway processes, spikes in resource usage, and overall system health.

* **Under the hood**
  These tools poll `/proc` periodically (default \~3 s for `top`), compute usage deltas, and render an interactive UI.

---

## 🚀 Senior-Admin Tips

* Adjust `top`’s refresh rate by pressing `d` and entering a new interval.
* In `htop`, press `F6` to change the sort field and `F9` to send signals interactively.
* Use `nice`/`renice` to change process priority:

  ```bash
  renice +5 <PID>
  ```
* For a lightweight real-time view without full UI:

  ```bash
  watch -n 2 'ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head'
  ```
* To view parent/child relationships once:

  ```bash
  ps --forest -eo pid,ppid,cmd
  ```


