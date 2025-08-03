

# 🧪 Lab 1 : Scripting Basics And Environment

## 📝 Task

> Practice creating a simple Bash script with a proper shebang and basic output.

**Example**:
Create a script named `hello.sh` that prints "Hello, World!" when executed.

---

## ✅ Steps

1. Create a new file named `hello.sh`.
2. Add the **shebang line** to indicate it's a Bash script.
3. Add an `echo` statement to print `"Hello, World!"`.
4. Save and close the file.

---

## 💡 Bonus

* Try modifying the message to include your name or today's date.
* Try omitting the shebang and run the script — what happens?

---

## 💻 Command(s)

```bash
touch 1Lab_ScriptingBasicsAndEnvironment.sh
vim 1Lab_ScriptingBasicsAndEnvironment.sh
```

Inside `1Lab_ScriptingBasicsAndEnvironment.sh`:

```bash
#!/usr/bin/bash
# Lab: Scripting Basics and Environment

# Scripting Basics & Preparation of the Lab
# 1. Create a file named hello.sh with the following content:
# 2. Make the file executable by running chmod +x hello.sh
# 3. Run the file by executing ./hello.sh
# 4. Create a directory named /tmp/hello and move the hello.sh file into it.
# 5. Run the hello.sh file from the /tmp/hello directory.
# 6. Create a file named hello.sh in the current directory and add the same content as in step 1.
# 7. Move the hello.sh file to the /

#Exercise 1.1: Your First Script
dir=$(pwd)
touch "$dir/hello.sh"
chmod +x "$dir/hello.sh"
echo "Hello World!" 

#Exercise 1.2: Script Permissions
echo '#!/usr/bin/bash' > "$dir/hello.sh"
echo 'echo "Hello World!"' >> "$dir/hello.sh"
chmod +x "$dir/hello.sh"
./hello.sh

#Exercise 1.3: Script with Comments

echo '#!/usr/bin/bash' > "$dir/info.sh"
echo '# This is a simple script' >> "$dir/info.sh"
echo 'echo "Hello World!"' >> "$dir/info.sh"
echo '"Current Date Is $(date)"' >> "$dir/info.sh"
echo '"Current Time Is $(date +"%H:%M:%S")"' >> "$dir/info.sh"
echo '"Current Date and Time Is $(date +"%d/%m/%Y %H:%M:%S")"' >> "$dir/info.sh"
echo '"Current Timezone Is $(date +"%Z")"' >> "$dir/info.sh"
echo '"Current Timezone Offset Is $(date +"%z")"' >> "$dir/info.sh"
echo '"Current Hostname Is $(hostname)"' >> "$dir/info.sh"
echo '"Current User Is $(whoami)"' >> "$dir/info.sh"
echo '"Current Working Directory Is $(pwd)"' >> "$dir/info.sh"
echo '"Current Shell Is $SHELL"' >> "$dir/info.sh"
echo '"Current Username Is $USER"' >> "$dir/info.sh"
chmod +x "$dir/info.sh"


#Exercise 1.4: Exit Codes
#Exercise 1.5: Basic Debugging
touch "$dir/debug.sh"
echo '#!/usr/bin/bash' > "$dir/debug.sh"
echo 'echo "This is a debug script"' >> "$dir/debug.sh"
echo 'set -x' >> "$dir/debug.sh"
echo 'echo "This is a debug script"' >> "$dir/debug.sh"
echo 'mkdir Debugging' >> "$dir/debug.sh"
echo ' touch Debugging/debug.txt' >> "$dir/debug.sh"
echo ' cd Debugging' >> "$dir/debug.sh"
echo ' echo "Debugging in progress..."' >> "$dir/debug.sh"
echo ' ls -l' >> "$dir/debug.sh"
echo ' set +x' >> "$dir/debug.sh"
chmod +x "$dir/debug.sh"


#Those Will be handled by Terminal 

./info.sh
./debug.sh

```

## 💡 Output 

```bash
[devops_ninja@Ahmed-Hossainy Labs]$ ls -h
'0Lab Template.md'   1Lab_ScriptingBasicsAndEnvironment.md   hello.sh
 1Lab_Hello.sh       1Lab_ScriptingBasicsAndEnvironment.sh
[devops_ninja@Ahmed-Hossainy Labs]$ rm hello.sh
[devops_ninja@Ahmed-Hossainy Labs]$ ls
'0Lab Template.md'   1Lab_ScriptingBasicsAndEnvironment.md
 1Lab_Hello.sh       1Lab_ScriptingBasicsAndEnvironment.sh
[devops_ninja@Ahmed-Hossainy Labs]$ chmod +x 1Lab_Hello.sh
[devops_ninja@Ahmed-Hossainy Labs]$ vim 1Lab_Hello.sh
[devops_ninja@Ahmed-Hossainy Labs]$ ./1Lab_Hello.sh 
Hello World!
Hello World!
[devops_ninja@Ahmed-Hossainy Labs]$ ls
'0Lab Template.md'   1Lab_ScriptingBasicsAndEnvironment.md   hello2.sh
 1Lab_Hello.sh       1Lab_ScriptingBasicsAndEnvironment.sh
[devops_ninja@Ahmed-Hossainy Labs]$ rm hello2.sh 
[devops_ninja@Ahmed-Hossainy Labs]$ ls
'0Lab Template.md'   1Lab_ScriptingBasicsAndEnvironment.md
 1Lab_Hello.sh       1Lab_ScriptingBasicsAndEnvironment.sh
[devops_ninja@Ahmed-Hossainy Labs]$ rm 1Lab_Hello.sh 
[devops_ninja@Ahmed-Hossainy Labs]$ ls
'0Lab Template.md'                       1Lab_ScriptingBasicsAndEnvironment.sh
 1Lab_ScriptingBasicsAndEnvironment.md
[devops_ninja@Ahmed-Hossainy Labs]$ echo date
date
[devops_ninja@Ahmed-Hossainy Labs]$ ./1Lab_ScriptingBasicsAndEnvironment.sh 
Hello World!
Hello World!
Hello World!
./info.sh: line 4: Current Date Is Sat Aug  2 03:58:11 PM EEST 2025: command not found
./info.sh: line 5: Current Time Is 15:58:11: command not found
./info.sh: line 6: Current Date and Time Is 02/08/2025 15:58:11: No such file or directory
./info.sh: line 7: Current Timezone Is EEST: command not found
./info.sh: line 8: Current Timezone Offset Is +0300: command not found
./info.sh: line 9: Current Hostname Is Ahmed-Hossainy: command not found
./info.sh: line 10: Current User Is devops_ninja: command not found
./info.sh: line 11: Current Working Directory Is /mnt/d/Enterprise Solutions/01 CloudAndDevOps/DevOps/DevOps-Hands-On/2BashScripting/Labs: No such file or directory
./info.sh: line 12: Current Shell Is /bin/bash: No such file or directory
./info.sh: line 13: Current Username Is devops_ninja: command not found
This is a debug script
+ echo 'This is a debug script'
This is a debug script
+ mkdir Debugging
+ touch Debugging/debug.txt
+ cd Debugging
+ echo 'Debugging in progress...'
Debugging in progress...
+ ls -l
total 0
-rwxrwxrwx 1 devops_ninja devops_ninja 0 Aug  2 15:58 debug.txt
+ set +x
[devops_ninja@Ahmed-Hossainy Labs]$ ls
'0Lab Template.md'                       Debugging   info.sh
 1Lab_ScriptingBasicsAndEnvironment.md   debug.sh
 1Lab_ScriptingBasicsAndEnvironment.sh   hello.sh
 
 [devops_ninja@Ahmed-Hossainy Labs]$ cat debug.sh 
#!/usr/bin/bash
echo "This is a debug script"
set -x
echo "This is a debug script"
mkdir Debugging
 touch Debugging/debug.txt
 cd Debugging
 echo "Debugging in progress..."
 ls -l
 set +x
```
Others Exercise run the codes in `.sh` File , Good Luck :)