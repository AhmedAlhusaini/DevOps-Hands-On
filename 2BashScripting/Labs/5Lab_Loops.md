# 🧪 Lab: Loops

## 📝 Task

> Practice various loop constructs in Bash—`for`, `while`, `until`, and nested loops—by writing scripts that count, process files, interact with users, monitor services, and generate tables.

This lab covers five exercises:

1. Basic `for` loop
2. File-processing `for` loop
3. `while` loop with user input
4. `until` loop example
5. Nested `for` loops

---

## ✅ Steps

1. **Exercise 5.1 – Basic For Loop (`count_loop.sh`)**

   * Write a `for` loop from 1 to 10
   * Inside the loop, `echo "Count: $i"`
   * When `$i` is 10, also print a special message (e.g., “Reached 10!”)

2. **Exercise 5.2 – File Processing Loop (`file_processor.sh`)**

   * Use `for file in *.txt` to iterate all `.txt` files
   * For each, use `wc -l` to count lines and display:
     `"Filename: $file – Lines: $n"`
   * Copy each to a backup: `cp "$file" "${file}.bak"`

3. **Exercise 5.3 – While Loop with User Input (`guessing_game.sh`)**

   * Generate a random number `target=$(( RANDOM % 10 + 1 ))`
   * Initialize `attempts=0`
   * Loop `while true` or `while [[ $guess != $target ]]`
   * Inside: prompt `read -p "Guess (1-10): " guess`

     * Increment `attempts`
     * If `guess` < `target`: echo “Higher”
     * If `guess` > `target`: echo “Lower”
     * Else break
   * After loop, echo “You got it in \$attempts attempts!”

4. **Exercise 5.4 – Until Loop Example (`service_monitor.sh`)**

   * Accept a process name or PID as input
   * Initialize `timeout=0`
   * Use `until pgrep "$proc" >/dev/null || (( timeout >= 12 ))` (12 × 5s = 1 min)

     * Inside: `sleep 5; (( timeout++ )); echo "Waiting for $proc…"`
   * After loop, if found (`pgrep` success) echo “\$proc is running.”

     * Else echo “Timeout waiting for \$proc.” and `exit 1`

5. **Exercise 5.5 – Nested Loops (`multiplication_table.sh`)**

   * Use outer `for i in {1..5}`
   * Inside, use inner `for j in {1..5}`

     * Compute `prod=$(( i * j ))`
     * `printf "%4d" "$prod"`
   * After inner loop, `echo` a newline to format as a table

---

## 💡 Bonus

* **5.1**: Add a pause (`sleep 1`) between counts.
* **5.2**: Skip empty files and log skipped filenames.
* **5.3**: Limit to 5 guesses, then reveal the number if not guessed.
* **5.4**: Allow a custom interval and timeout via command-line args.
* **5.5**: Align columns dynamically for larger table sizes.

---

## 💻 Command(s)

```bash
Others Exercise run the codes in `.sh` File , Good Luck :)
```
