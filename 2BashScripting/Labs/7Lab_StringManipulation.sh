#!/usr/bin/bash

# Exercise 7.1 : Basic String Manipulation

#!/bin/bash
# string_basics.sh – Basic string operations

# 1. Read a full sentence from the user
read -p "Enter a sentence: " sentence

# 2. Display its length
echo "Length      : ${#sentence}"

# 3. Convert to uppercase
echo "Uppercase   : ${sentence^^}"

# 4. Convert to lowercase
echo "Lowercase   : ${sentence,,}"

# 5. Extract and display the first 10 characters
echo "First 10 Chars: ${sentence:0:10}"


# Exercise 7.2 : File Name Processing

# 1. Read a filename
read -p "Enter filename (e.g., document.pdf.backup): " file

# 2. Extract base name (before first dot)
echo "Base name            : ${file%%.*}"

# 3. Extract last extension (after last dot)
echo "Last extension       : ${file##*.}"

# 4. Extract name without the last extension
echo "Name w/o last ext    : ${file%.*}"


# Exercise 7.3 : String Replacement 

# 1. Read original text
read -p "Enter text: " line

# 2. Read the word to find
read -p "Word to replace: " find

# 3. Read the replacement word
read -p "Replace with: " repl

# 4. Show original
echo "Original   : $line"

# 5. Replace first occurrence
echo "First rep  : ${line/$find/$repl}"

# 6. Replace all occurrences
echo "All reps   : ${line//"$find"/"$repl"}"

# Excercise 7.4 : Path Manipulation 

# 1. Read a full file path
read -p "Enter full path (e.g., /home/user/docs/file.txt): " path

# 2. Extract directory path
echo "Directory : ${path%/*}"

# 3. Extract filename
echo "Filename  : ${path##*/}"

# 4. Check if absolute or relative
if [[ $path = /* ]]; then
  echo "Path type : Absolute"
else
  echo "Path type : Relative"
fi


# Exercise 7.5 : Log File Analysis
# 1. Generate a sample log file
cat <<EOF > sample.log
2025-08-03 10:00:00 INFO  Service started
2025-08-03 10:05:00 ERROR Connection failed
2025-08-03 10:10:00 INFO  Retrying connection
2025-08-03 10:15:00 ERROR Timeout occurred
EOF

# 2. Extract timestamps
timestamps=($(grep -oE '^[0-9-]{10} [0-9:]{8}' sample.log))
echo "Timestamps: ${timestamps[*]}"

# 3. Count ERROR vs INFO messages
error_count=$(grep -c "ERROR" sample.log)
info_count=$(grep -c "INFO" sample.log)

# 4. Display summary
echo "ERROR messages: $error_count"
echo "INFO messages : $info_count"
# 5. Clean up
rm sample.log
