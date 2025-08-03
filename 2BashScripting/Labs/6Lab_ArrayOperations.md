# 🧪 Lab: Array Operations

## 📝 Task

> Explore indexed arrays, associative arrays, and dynamic array manipulation in Bash.

This lab includes four exercises:

1. Basic indexed array usage
2. Array from command output
3. Associative array demo
4. Dynamic array manipulation

---

## ✅ Steps

1. **Exercise 6.1 – Basic Array Operations (`fruit_array.sh`)**

   * Declare an indexed array of 5 fruits
   * Print all elements `${fruits[*]}`
   * Print count `${#fruits[@]}`
   * Print first `${fruits[0]}` and last `${fruits[${#fruits[@]}-1]}`

2. **Exercise 6.2 – Array from Command Output (`file_array.sh`)**

   * Populate an array with all files in the current directory: `files=( * )`
   * Loop over `${files[@]}`, use `stat -c%s` to get size
   * Count regular files vs directories with `-f` and `-d`

3. **Exercise 6.3 – Associative Array Demo (`student_grades.sh`)**

   * Declare `declare -A grades` with 5 students
   * Loop over keys and print name + grade
   * Sum grades, compute average

4. **Exercise 6.4 – Dynamic Array Manipulation (`dynamic_array.sh`)**

   * Start with empty array `items=()`
   * Prompt user in a loop to add items until they type “done”
   * Display the final array
   * Prompt to remove an index, use `unset items[index]`
   * Display the updated array

---

## 💡 Bonus

* **6.1**: Sort the fruit array alphabetically.
* **6.2**: Include hidden files (`files=( .* * )`) and skip `.`/`..`.
* **6.3**: Allow user input to add more students and grades.
* **6.4**: Implement “undo” to re-add the last removed item.

---

## 💻 Command(s)
```bash
Others Exercise run the codes in `.sh` File , Good Luck :)
```
