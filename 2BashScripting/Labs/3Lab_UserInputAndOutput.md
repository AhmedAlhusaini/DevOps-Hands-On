# 🧪 Lab: User Input & Output

## 📝 Task

> Practice various methods of reading user input (interactive, silent, validated) and redirecting output/errors in Bash scripts.

This lab covers four exercises:

1. Interactive prompts
2. Silent password entry
3. Input validation loop
4. File creation, appending, display, and error redirection

---

## ✅ Steps

1. **Exercise 3.1 – Interactive Input**

   * Create `user_profile.sh`
   * Prompt for **name**, **age**, and **city** using `read -p`
   * Display a summary of the collected data

2. **Exercise 3.2 – Silent Input**

   * Create `password_demo.sh`
   * Prompt for **username** normally
   * Prompt for **password** with `read -s -p` (no echo)
   * Display only the username

3. **Exercise 3.3 – Input Validation**

   * Create `age_validator.sh`
   * Loop until the user enters a **numeric** age (`[[ … =~ ^[0-9]+$ ]]`)
   * After valid entry, classify age as **child**, **teen**, **adult**, or **senior**

4. **Exercise 3.4 – File Redirection**

   * Create `file_operations.sh`
   * Write initial content to `output.txt`
   * Append additional content
   * Display the file with `cat`
   * Redirect any errors (e.g., `ls /nonexistent`) into `errors.log`

---

## 💡 Bonus

* **Age Validator**: Limit the number of retries (e.g., 3 attempts) before exiting with a non-zero code.
* **Error Log Timestamps**: Prepend each error line in `errors.log` with a timestamp (`date +"%Y-%m-%d %H:%M:%S"`).
* **Argument-driven**: Allow passing flags like `-r` to set retry counts or `-l` to specify a custom log file.

---

## 💻 Command(s)

```bash

[devops_ninja@Ahmed-Hossainy LabTesting]$ ls
3Lab_UserInputAndOutput.sh
[devops_ninja@Ahmed-Hossainy LabTesting]$ ./3Lab_UserInputAndOutput.sh 
Please enter your age: 10
You are a Child.
Enter your age: 25
You are an adult.
You are an adult.
You are an adult.
[devops_ninja@Ahmed-Hossainy LabTesting]$ ls
3Lab_UserInputAndOutput.sh  file_operations.sh  password_demo.sh  user_profile.sh
[devops_ninja@Ahmed-Hossainy LabTesting]$ ./user_profile.sh 
Enter your name: Ahmed
Enter your age: 25
Enter your city: Cairo
Profile: Ahmed, 25, Cairo
[devops_ninja@Ahmed-Hossainy LabTesting]$ ./password_demo.sh 
Username: Amed
Password: 
Username is: Amed
[devops_ninja@Ahmed-Hossainy LabTesting]$ ./file_operations.sh 
----- output.txt -----
Initial content
Appended content
Errors are in errors.log
[devops_ninja@Ahmed-Hossainy LabTesting]$ ls 
3Lab_UserInputAndOutput.sh  errors.log  file_operations.sh  output.txt  password_demo.sh  user_profile.sh
[devops_ninja@Ahmed-Hossainy LabTesting]$ tree
.
├── 3Lab_UserInputAndOutput.sh
├── errors.log
├── file_operations.sh
├── output.txt
├── password_demo.sh
└── user_profile.sh

1 directory, 6 files

```
Others Exercise run the codes in `.sh` File , Good Luck :)