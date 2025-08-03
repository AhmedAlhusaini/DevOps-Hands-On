# 🧪 Lab 4: Conditional Statements

## 📝 Task

> Practice using Bash conditional constructs (`if`, `elif`, `else`, and `case`) to build scripts that check files, compare numbers, calculate grades, present menus, and verify system requirements.

This lab contains five exercises:

1. File existence and permissions check
2. Numeric comparison with validation
3. Grade assignment based on score
4. Interactive menu via `case`
5. System environment checks (disk, commands, user privileges)

---

## ✅ Steps

1. **Exercise 4.1 – File Checker**

   * Create `file_checker.sh`
   * Accept a filename as `$1`
   * Use `if [ -e "$file" ]` to test existence
   * If it exists, use `-r`, `-w`, `-x` flags to report readability, writability, executability
   * If it doesn’t exist, prompt the user (`read -p`) whether to create it and act accordingly

2. **Exercise 4.2 – Number Comparison**

   * Create `number_compare.sh`
   * Accept two arguments `$1` and `$2`
   * Validate each with a regex (`[[ $1 =~ ^[0-9]+$ ]]`)
   * Use numeric tests (`-gt`, `-lt`, `-eq`) to determine which is larger or if equal

3. **Exercise 4.3 – Grade Calculator**

   * Create `grade_calc.sh`
   * Prompt user for a score (0–100) via `read -p`
   * Validate numeric range and then assign letters:

     * 90–100 → A
     * 80–89  → B
     * 70–79  → C
     * 60–69  → D
     * <60    → F
   * Display the letter grade with a message

4. **Exercise 4.4 – Case Statement Menu**

   * Create `simple_menu.sh`
   * In a loop, display:

     ```
     1) Date
     2) Calendar
     3) Users
     4) Exit
     ```
   * Use `case $choice in … esac` to run `date`, `cal`, `who`, or exit
   * Repeat until the user selects “Exit”

5. **Exercise 4.5 – System Requirements Check**

   * Create `system_check.sh`
   * Check for ≥1 GB free disk space (`df -h / | awk '/\\// {print $4}'`)
   * Test if commands like `curl` or `git` exist (`command -v`)
   * Detect if running as root (`[ "$EUID" -eq 0 ]`)
   * Print human-readable status messages for each check

---

## 💡 Bonus

* **File Checker**: Also report file size and owner.
* **Number Compare**: Extend to floating-point comparisons using `bc`.
* **Grade Calc**: Allow multiple scores as arguments and loop over them.
* **Menu**: Add options for disk usage and memory stats.
* **System Check**: Log all results to a timestamped logfile in `/var/log`.

---

## 💻 Command(s)

```bash
# Exercise 4.1
touch file_checker.sh
echo '#!/bin/bash'                       >> file_checker.sh

# Exercise 4.2
touch number_compare.sh
echo '#!/bin/bash'                       >> number_compare.sh

# Exercise 4.3
touch grade_calc.sh
echo '#!/bin/bash'                       >> grade_calc.sh

# Exercise 4.4
touch simple_menu.sh
echo '#!/bin/bash'                       >> simple_menu.sh

# Exercise 4.5
touch system_check.sh
echo '#!/bin/bash'                       >> system_check.sh

# Make all scripts executable
chmod +x file_checker.sh number_compare.sh grade_calc.sh simple_menu.sh system_check.sh
```

## 📖 Outputs

```bash
# Exercise 4.1
# Check if file exists and report permissions
[devops_ninja@Ahmed-Hossainy LabTesting]$ ls -ial 
total 4
2533274790397603 drwxrwxrwx 1 devops_ninja devops_ninja  512 Aug  3 00:38 .
2251799813685641 drwxrwxrwx 1 devops_ninja devops_ninja  512 Aug  3 00:34 ..
2814749767108265 -rwxrwxrwx 1 devops_ninja devops_ninja 1008 Aug  3 00:46 file_checker.sh
2814749767108266 -rwxrwxrwx 1 devops_ninja devops_ninja    0 Aug  3 00:38 FileForChecker.sh
[devops_ninja@Ahmed-Hossainy LabTesting]$ ./file_checker.sh 
Enter the file name to check: FileForChecker.sh
./file_checker.sh: line 41: syntax error: unexpected end of file
[devops_ninja@Ahmed-Hossainy LabTesting]$ ./file_checker.sh 
Enter the file name to check: FileForChecker.sh
./file_checker.sh: line 41: syntax error: unexpected end of file
[devops_ninja@Ahmed-Hossainy LabTesting]$ cp ../4Lab_ConditionalStatments.sh ./file_checker.sh
[devops_ninja@Ahmed-Hossainy LabTesting]$ ./file_checker.sh
Enter the file name to check: FileForChecker.sh
File 'FileForChecker.sh' exists.
File 'FileForChecker.sh' is readable.
File 'FileForChecker.sh' is writable.
File 'FileForChecker.sh' is executable.
[devops_ninja@Ahmed-Hossainy LabTesting]$ chmod 000 FileForChecker.sh 
[devops_ninja@Ahmed-Hossainy LabTesting]$ ./file_checker.sh
Enter the file name to check: FileForChecker.sh
File 'FileForChecker.sh' exists.
File 'FileForChecker.sh' is readable.
File 'FileForChecker.sh' is not writable.
File 'FileForChecker.sh' is executable.
[devops_ninja@Ahmed-Hossainy LabTesting]$ ls -ial
total 4
2533274790397603 drwxrwxrwx 1 devops_ninja devops_ninja  512 Aug  3 00:38 .
2251799813685641 drwxrwxrwx 1 devops_ninja devops_ninja  512 Aug  3 00:34 ..
2814749767108265 -rwxrwxrwx 1 devops_ninja devops_ninja 1009 Aug  3 00:47 file_checker.sh
2814749767108266 -r-xr-xr-x 1 devops_ninja devops_ninja    0 Aug  3 00:38 FileForChecker.sh
[devops_ninja@Ahmed-Hossainy LabTesting]$ ./file_checker.sh 
Enter the file name to check: AhmedFile.sh
File 'AhmedFile.sh' does not exist.
Do you want to create it? (y/n): y
File 'AhmedFile.sh' created.
[devops_ninja@Ahmed-Hossainy LabTesting]$ ls -ial 
total 4
2533274790397603 drwxrwxrwx 1 devops_ninja devops_ninja  512 Aug  3 00:49 .
2251799813685641 drwxrwxrwx 1 devops_ninja devops_ninja  512 Aug  3 00:34 ..
1688849860265643 -rwxrwxrwx 1 devops_ninja devops_ninja    0 Aug  3 00:49 AhmedFile.sh
2814749767108265 -rwxrwxrwx 1 devops_ninja devops_ninja 1009 Aug  3 00:47 file_checker.sh
2814749767108266 -r-xr-xr-x 1 devops_ninja devops_ninja    0 Aug  3 00:38 FileForChecker.sh
```
Others Exercise run the codes in `.sh` File , Good Luck :)