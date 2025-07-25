# 🧪 Lab: File Permissions Practice

## 📝 Task

> Learn to manage file permissions and ownership:
> - Create a file called `secret.txt` in your home directory  
> - Check the current permissions of the file  
> - Change the permissions so only you can read and write the file  
> - Create a script file called `hello.sh`  
> - Make the script executable for everyone  
> - Check the permissions again to verify the changes  

---

## ✅ Steps

1. Navigate to your home directory.  
2. Create `secret.txt`.  
3. Use a command to display its permissions.  
4. Modify permissions so only the owner has read/write.  
5. Create `hello.sh`.  
6. Change its mode to allow execution by all users.  
7. Re-display permissions to confirm your changes.  

---

## 💡 Bonus

- Ensure that `secret.txt` remains non-executable even if someone copies it.  --> alias cp='cp --no-preserve=mode'
- Test script execution as another user (e.g., via `sudo -u`).  
- Explore symbolic vs. numeric permission notation (`chmod u=rw,go= secret.txt` vs. `chmod 600 secret.txt`).  

---

## 💻 Command(s)

```bash

ubuntu@UbuntUmachine:~$ touch secret.txt
ubuntu@UbuntUmachine:~$ ls -l
total 4
drwxrwxr-x 6 ubuntu ubuntu 4096 Jul 24 14:11 my_projects
-rw-rw-r-- 1 ubuntu ubuntu    0 Jul 24 15:37 secret.txt
ubuntu@UbuntUmachine:~$ chmod g-r-w secret.txt
ubuntu@UbuntUmachine:~$ ls -l
total 4
drwxrwxr-x 6 ubuntu ubuntu 4096 Jul 24 14:11 my_projects
-rw----r-- 1 ubuntu ubuntu    0 Jul 24 15:37 secret.txt
ubuntu@UbuntUmachine:~$ chmod a-r-w secret.txt
ubuntu@UbuntUmachine:~$ ls -l
total 4
drwxrwxr-x 6 ubuntu ubuntu 4096 Jul 24 14:11 my_projects
---------- 1 ubuntu ubuntu    0 Jul 24 15:37 secret.txt
ubuntu@UbuntUmachine:~$ chmod 700 secret.txt
ubuntu@UbuntUmachine:~$ ls -l
total 4
drwxrwxr-x 6 ubuntu ubuntu 4096 Jul 24 14:11 my_projects
-rwx------ 1 ubuntu ubuntu    0 Jul 24 15:37 secret.txt
ubuntu@UbuntUmachine:~$ ls
my_projects  secret.txt
ubuntu@UbuntUmachine:~$ echo -e '#!/bin/bash\n\necho "Hello, welcome to Linux"' > hello.sh
ubuntu@UbuntUmachine:~$ ls
hello.sh  my_projects  secret.txt
ubuntu@UbuntUmachine:~$ ./hello.sh
-bash: ./hello.sh: Permission denied
ubuntu@UbuntUmachine:~$ ls -l
total 8
-rw-rw-r-- 1 ubuntu ubuntu   44 Jul 24 15:46 hello.sh
drwxrwxr-x 6 ubuntu ubuntu 4096 Jul 24 14:11 my_projects
-rwx------ 1 ubuntu ubuntu    0 Jul 24 15:37 secret.txt
ubuntu@UbuntUmachine:~$ chmod o+x hello.sh
ubuntu@UbuntUmachine:~$ ls -l
total 8
-rw-rw-r-x 1 ubuntu ubuntu   44 Jul 24 15:46 hello.sh
drwxrwxr-x 6 ubuntu ubuntu 4096 Jul 24 14:11 my_projects
-rwx------ 1 ubuntu ubuntu    0 Jul 24 15:37 secret.txt
ubuntu@UbuntUmachine:~$ ./hello.sh
-bash: ./hello.sh: Permission denied
ubuntu@UbuntUmachine:~$ chmod u+x hello.sh
ubuntu@UbuntUmachine:~$ ls -l
total 8
-rwxrw-r-x 1 ubuntu ubuntu   44 Jul 24 15:46 hello.sh
drwxrwxr-x 6 ubuntu ubuntu 4096 Jul 24 14:11 my_projects
-rwx------ 1 ubuntu ubuntu    0 Jul 24 15:37 secret.txt
ubuntu@UbuntUmachine:~$ ./hello.sh
Hello, welcome to Linux
ubuntu@UbuntUmachine:~$

