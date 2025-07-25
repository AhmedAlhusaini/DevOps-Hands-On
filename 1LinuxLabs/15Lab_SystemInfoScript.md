# 🧪 Lab: Creating a Simple Script

## 📝 Task

> Write and execute your first shell script:
> - Create a new file called `system_info.sh`  
> - Write a script that displays:  
>   - Current date and time  
>   - Your username  
>   - Current directory  
>   - Available disk space  
> - Make the script executable  
> - Run your script and verify it works  

---

## ✅ Steps

1. Create an empty script file.  
2. Open the file in your favorite editor.  
3. Add the shebang and commands for date, username, directory, and disk space.  
4. Save and exit the editor.  
5. Change the file’s mode to make it executable.  
6. Execute the script and confirm the output is correct.  

---

## 💡 Bonus

- Add colorized output using ANSI escape codes (e.g., `\e[32m` for green).  
- Include a usage/help message when run with `-h` or `--help`.  
- Redirect output to both the screen and a log file (`tee system_info.log`).  
- As a senior tip: check for dependencies (e.g., verify `df` exists) at the top of your script with `command -v`.  

---

## 💻 Command(s)

```bash

devops_ninja@Ahmed-Hossainy:~$ touch system_info.sh
devops_ninja@Ahmed-Hossainy:~$ nano system_info.sh
devops_ninja@Ahmed-Hossainy:~$ cat system_info.sh
#!/bin/bash

currDate= $(date +%Y%m%d)
echo "Hello , Welcom Backup . Now Time Is {currDate}"
devops_ninja@Ahmed-Hossainy:~$ chmod 777 system_info.sh
devops_ninja@Ahmed-Hossainy:~$ ./system_info.sh
./system_info.sh: line 3: 20250725: command not found
Hello , Welcom Backup . Now Time Is {currDate}
devops_ninja@Ahmed-Hossainy:~$ nano system_info.sh
devops_ninja@Ahmed-Hossainy:~$ ./system_info.sh
./system_info.sh: line 3: 20250725: command not found
Hello , Welcom Backup . Now Time Is {currDate}
devops_ninja@Ahmed-Hossainy:~$ nano system_info.sh
devops_ninja@Ahmed-Hossainy:~$ ./system_info.sh
./system_info.sh: line 3: 20250725: command not found
Hello , Welcom Backup . Now Time Is
devops_ninja@Ahmed-Hossainy:~$ nano system_info.sh
devops_ninja@Ahmed-Hossainy:~$ ./system_info.sh
./system_info.sh: line 3: 20250725: command not found

Hello , Welcom Backup . Now Time Is
devops_ninja@Ahmed-Hossainy:~$ nano system_info.sh
devops_ninja@Ahmed-Hossainy:~$ ./system_info.sh
./system_info.sh: line 2: currDate: command not found

Hello , Welcom Backup . Now Time Is
devops_ninja@Ahmed-Hossainy:~$ nano system_info.sh
devops_ninja@Ahmed-Hossainy:~$ ./system_info.sh
20250725


devops_ninja@Ahmed-Hossainy:~$ cat system_info.sh
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
devops_ninja@Ahmed-Hossainy:~$

devops_ninja@Ahmed-Hossainy:~$ ./system_info.sh
Hello, welcome to Backup! Now Time Is: 20250725

My Name Is devops_ninja — Your Copilot

You are now at /home/devops_ninja — Be Careful

Memory & Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
none            7.8G     0  7.8G   0% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
none            7.8G  4.0K  7.8G   1% /mnt/wsl
drivers         261G  219G   42G  85% /usr/lib/wsl/drivers
/dev/sdd       1007G  3.5G  953G   1% /
none            7.8G   92K  7.8G   1% /mnt/wslg
none            7.8G     0  7.8G   0% /usr/lib/wsl/lib
rootfs          7.8G  2.7M  7.8G   1% /init
none            7.8G  852K  7.8G   1% /run
none            7.8G     0  7.8G   0% /run/lock
none            7.8G     0  7.8G   0% /run/shm
none            7.8G   76K  7.8G   1% /mnt/wslg/versions.txt
none            7.8G   76K  7.8G   1% /mnt/wslg/doc
C:\             261G  219G   42G  85% /mnt/c
D:\             531G  503G   29G  95% /mnt/d
E:\             140G   70G   71G  50% /mnt/e
snapfuse         67M   67M     0 100% /snap/core24/1055
snapfuse         11M   11M     0 100% /snap/htop/5021
snapfuse         51M   51M     0 100% /snap/snapd/24718
snapfuse         11M   11M     0 100% /snap/htop/5092
snapfuse         50M   50M     0 100% /snap/snapd/24792
snapfuse         67M   67M     0 100% /snap/core24/1006
tmpfs           7.8G   16K  7.8G   1% /run/user/1000

```

## Bouns Tips

Here’s a **simple, hands-on mini-lab** to practice those two bonus techniques:

---

## 🔹 Bonus Lab A: Incremental Backups with `rsync -a`

1. **Prepare a source folder**

   ```bash
   mkdir -p ~/demo_src
   echo “Hello” > ~/demo_src/file1.txt
   echo “World” > ~/demo_src/file2.txt
   ```

2. **Create an initial “backup”**

   ```bash
   mkdir -p ~/demo_backup
   rsync -a ~/demo_src/ ~/demo_backup/
   ```

   * Check that `demo_backup/` now has your two files.

3. **Modify the source**

   ```bash
   echo “!” >> ~/demo_src/file1.txt
   echo “New file” > ~/demo_src/file3.txt
   ```

4. **Run `rsync` again**

   ```bash
   rsync -a --delete ~/demo_src/ ~/demo_backup/
   ```

   * Only `file1.txt` (changed) and `file3.txt` (new) will be transferred.
   * If you delete a file in `demo_src`, `--delete` will remove it from `demo_backup` on the next run.

5. **Verify**

   ```bash
   ls ~/demo_backup
   cat ~/demo_backup/file1.txt
   ```

   You’ll see that `file1.txt` has the appended “!” and `file3.txt` exists.

---

## 🔹 Bonus Lab B: Timestamped Archives

1. **Prepare a folder to archive**

   ```bash
   mkdir -p ~/demo_archive
   echo “Archive me” > ~/demo_archive/item.txt
   ```

2. **Create a dated archive**

   ```bash
   tar czvf backup-$(date +%Y%m%d).tar.gz -C ~ demo_archive
   ```

   * Check with `ls backup-*.tar.gz`—you’ll see something like `backup-20250725.tar.gz`.

3. **List its contents**

   ```bash
   tar tzvf backup-$(date +%Y%m%d).tar.gz
   ```

   * Ensures the right folder and files are inside.

4. **Extract it to test**

   ```bash
   mkdir ~/demo_restore
   tar xzvf backup-$(date +%Y%m%d).tar.gz -C ~/demo_restore
   ls ~/demo_restore/demo_archive
   ```

   * Confirms your archive unpacks correctly.

