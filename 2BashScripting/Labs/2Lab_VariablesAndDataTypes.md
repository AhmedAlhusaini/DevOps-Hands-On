# 🧪 Lab 2 : Variables and Data Types

## 📝 Task

> Learn how to define variables, use command substitution, understand environment vs shell scope, use special parameters, and apply default values in Bash scripting.

---

## ✅ Steps

### 🔹 Exercise 2.1 – Basic Variables

1. Create a script named `variables.sh`.
2. Declare variables: `name`, `age`, and `color`.
3. Print a sentence using these variables:
   *"My name is \[name], I am \[age] years old, and my favorite color is \[color]."*

---

### 🔹 Exercise 2.2 – Command Substitution

1. Create a script called `system_info.sh`.
2. Use command substitution (`$(...)`) to store:

   * Current date & time → `date`
   * Current username → `whoami`
   * Number of files in current directory → `ls | wc -l`
   * Disk usage of home directory → `du -sh ~`
3. Print them in readable format.

---

### 🔹 Exercise 2.3 – Environment vs Shell Variables

1. Create a script called `var_scope.sh`.
2. Define:

   * Shell variable: `LOCAL_VAR="local"`
   * Exported env variable: `export GLOBAL_VAR="global"`
3. Call another script: `child_script.sh`
4. In `child_script.sh`, try to access both variables and print their values.
5. Observe and explain which one is accessible.

---

### 🔹 Exercise 2.4 – Special Variables

1. Create a script called `special_vars.sh`.
2. Use:

   * `$0` for script name
   * `$@` for all passed arguments
   * `$#` for argument count
   * `$1`, `$2`, `$3` for individual arguments
3. Test it by running:

   ```bash
   ./special_vars.sh apple banana cherry
   ```

---

### 🔹 Exercise 2.5 – Default Values

1. Create a script called `defaults.sh`.
2. Accept a `username` as `$1` and default to `"guest"` if not provided.
3. Accept a `greeting` as `$2` and default to `"Hello"` if not provided.
4. Display:
   *"\[greeting], \[username]!"*

---

## 💡 Bonus

* Print variable types using `declare -p`.
* Try exporting a function along with a variable.
* Try passing more than 3 arguments to `special_vars.sh` and loop through `$@`.

---

## 💻 Output(s)

```bash
ahmed.elhossainy@Ahmed-Hossainy MINGW64 /d/Enterprise Solutions/01 CloudAndDevOps/DevOps/DevOps-Hands-On/2BashScripting/Labs/Lab2 (main)
$ bash variables.sh 
 Hello Alhusainy  , you Faviorite Color Is Blue and your age is 35
 Hello Alhusainy , you Faviorite Color Is Blue and your age is 35
 Hello Alhusainy , you Faviorite Color Is Blue and your age is 35
The current date is: Sat, Aug  2, 2025  5:04:07 PM
The current user is: ahmed.elhossainy | From 
The current working directory is: /d/Enterprise Solutions/01 CloudAndDevOps/DevOps/DevOps-Hands-On/2BashScripting/Labs/Lab2
 Number of Files is : 5
5.0K    /d/Enterprise Solutions/01 CloudAndDevOps/DevOps/DevOps-Hands-On/2BashScripting/Labs/Lab2
Local Variable is Local Variable
Global Variable is global
Executing child script...
Local Variable is 
Global Variable is global
Child script executed with variables:
Child script executed.
Script Name: ./special_vars.sh
All Arguments: apple banana cherry
Number of Arguments: 3
Argument 1: apple
Argument 2: banana
Argument 3: cherry
Hello, guest!
Hello, ahmed!
Salaam, Alhusiny!

ahmed.elhossainy@Ahmed-Hossainy MINGW64 /d/Enterprise Solutions/01 CloudAndDevOps/DevOps/DevOps-Hands-On/2BashScripting/Labs/Lab2 (main)
$ ls
child_Scrip.sh*  defaults.sh*  special_vars.sh*  var_Scope.sh*  variables.sh*
```
Others Exercise run the codes in `.sh` File , Good Luck :)

## Bouns Exercise

Below is a breakdown of the Bash built-in `declare` (a.k.a. `typeset`) and its most common options. Think of `declare` as a way to **set attributes** on variables (type, readonly, export) and to **inspect** them.

---

## 🔧 `declare` Usage

```bash
declare [options] [name[=value] …]
```

* **Without options**, `declare var=value` simply assigns `value` to `var`.
* **With options**, you can control its type, visibility, and behavior.

---

## 🔑 Key Options

| Option | Meaning                                                     | Example                                                 |
| :----- | :---------------------------------------------------------- | :------------------------------------------------------ |
| `-p`   | **Print** variable declaration (type & value)               | `declare -p foo` → `declare -- foo="bar"`               |
| `-i`   | Treat variable as **integer** (arithmetic context)          | `declare -i count=5`                                    |
| `-r`   | Mark variable **readonly** (cannot be reassigned)           | `declare -r PI=3.14`                                    |
| `-x`   | **Export** variable to child processes (environment)        | `declare -x PATH`                                       |
| `-a`   | Declare an **indexed array**                                | `declare -a fruits=(apple banana cherry)`               |
| `-A`   | Declare an **associative array**                            | `declare -A grades=([Alice]=A [Bob]=B)`                 |
| `-l`   | Force value to **lowercase** on assignment                  | `declare -l name="Ahmed"` → `echo $name` prints `ahmed` |
| `-u`   | Force value to **uppercase** on assignment                  | `declare -u lang="bash"` → `echo $lang` prints `BASH`   |
| `-t`   | Mark variable as a **trace** variable (print on assignment) | `declare -t var`                                        |
| `-f`   | Operate on **functions** instead of variables               | `declare -f myfunc`                                     |

---

## 🧪 Examples

### 1. Printing a variable (`-p`)

```bash
foo="bar"
declare -p foo
# → declare -- foo="bar"
```

### 2. Integer arithmetic (`-i`)

```bash
declare -i counter=1
counter+=2
echo $counter    # → 3
```

### 3. Readonly variable (`-r`)

```bash
declare -r MAX_USERS=100
MAX_USERS=200    # → error: readonly variable
```

### 4. Exporting (`-x`)

```bash
declare -x API_KEY="abcd1234"
bash -c 'echo "Child sees $API_KEY"'   # → abcd1234
```

### 5. Indexed array (`-a`)

```bash
declare -a colors=(red green blue)
declare -p colors
# → declare -a colors=([0]="red" [1]="green" [2]="blue")
```

### 6. Associative array (`-A`)

```bash
declare -A user_info=([name]="Ahmed" [role]="admin")
declare -p user_info
# → declare -A user_info=([name]="Ahmed" [role]="admin")
```

### 7. Case conversion (`-u` / `-l`)

```bash
declare -u U="hello"; echo $U   # → HELLO
declare -l L="WORLD"; echo $L   # → world
```

---

## 💡 When to Use `declare`

* **Type safety**: ensure a variable is always treated as an integer.
* **Immutable values**: use `-r` for constants (e.g., `PI`).
* **Export control**: explicitly mark which vars go to subprocesses.
* **Complex data**: create and inspect arrays (indexed or associative).
* **Debugging**: use `-p` to dump variable state, or `-t` to trace assignments.
