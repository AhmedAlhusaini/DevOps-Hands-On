# 🧪 Lab: String Manipulation

## 📝 Task

> Practice common string operations in Bash: measuring length, case conversion, slicing, parsing filenames, replacing text, path handling, and log analysis.

This lab consists of five exercises:

1. Basic string operations
2. Filename parsing
3. String replacement
4. Path parsing
5. Log file analysis

---

## ✅ Steps

1. **Exercise 7.1 – Basic String Operations (`string_basics.sh`)**

   * Prompt/read a full sentence
   * Use `${#var}` to get its length
   * Use `${var^^}` and `${var,,}` to convert case
   * Use `${var:0:10}` to extract the first 10 characters

2. **Exercise 7.2 – Filename Processing (`filename_tools.sh`)**

   * Read a filename (e.g., `document.pdf.backup`)
   * Use `${file%%.*}` to get base name
   * Use `${file##*.}` to get last extension
   * Use `${file%.*}` to strip only the last extension

3. **Exercise 7.3 – String Replacement (`text_replace.sh`)**

   * Read an input line and two words: `find` and `replace`
   * Use `${line/$find/$replace}` for first occurrence
   * Use `${line//"$find"/"$replace"}` for all occurrences
   * Display original and both modified versions

4. **Exercise 7.4 – Path Manipulation (`path_parser.sh`)**

   * Read a full path (e.g., `/home/user/documents/file.txt`)
   * Use `${path%/*}` for directory path
   * Use `${path##*/}` for filename
   * Test absolute vs relative via `[[ $path = /* ]]`

5. **Exercise 7.5 – Log File Analyzer (`log_analyzer.sh`)**

   * Generate or write a sample logfile with timestamps and levels
   * Use parameter expansion or `grep -o` to extract timestamps
   * Count lines matching `ERROR` vs `INFO`
   * Display a summary report

---

## 💡 Bonus

* **7.1**: Reverse the string using `rev` or a loop.
* **7.2**: Handle filenames with multiple dots elegantly.
* **7.3**: Implement replacement using `sed` and compare.
* **7.4**: Check if the file at the path exists and is readable.
* **7.5**: Allow filtering by date range and output to CSV.

---

## 💻 Command(s)
```bash
Others Exercise run the codes in `.sh` File , Good Luck :)
```