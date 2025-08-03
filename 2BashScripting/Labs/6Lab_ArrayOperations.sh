#!/usr/bin/bash

# Exercise 6.1 : Basic Array Operation 

# 1. Create an indexed array of 5 fruits
fruits=(apple banana cherry date elderberry)

# 2. Display all fruits
echo "All fruits: ${fruits[*]}"
echo "All fruits:" "${fruits[@]}"

# 3. Display the number of fruits
echo "Number of fruits: ${#fruits[@]}"

# 4. Display the first fruit
echo "First fruit: ${fruits[0]}"

# 5. Display the last fruit
last_index=$(( ${#fruits[@]} - 1 ))
echo "Last fruit: ${fruits[$last_index]}"


#Additional operations To Get Last Element
# This takes “all elements” but starts 1 from the end
last="${fruits[@]: -1}"
echo "Last fruit: $last"


# Directly index from the end
echo "Last fruit: ${fruits[-1]}"


# Exercise 6.2 : Array From Command Output 
for file in *; do
    echo "File: $file And Size is $(du -sh "$file")"
done

myFiles=($(ls))

for file in "${myFiles[@]}"; do
    echo "File: $file And Size is $(du -sh "$file")"
done

dir=0
fil=0
again=($(ls -al | awk '{print $1}'))
for file in "${again[@]}"; do
	#echo "File permissions: $file"
	if [[ $file == d* ]]; then
		echo "Directory: $file"
		((dir++))
	else
		echo "File: $file"
		((fil++))
	fi
done

echo "Total directories: $dir"
echo "Total files: $fil"


# Exercise 6.3 : Associative Array Demo

#!/bin/bash
# student_grades.sh – Store student grades in an associative array and compute the average

# 1. Declare an associative array with student names and their grades
declare -A grades=(
  ["Alice"]=85
  ["Bob"]=92
  ["Carol"]=78
  ["Dave"]=88
  ["Eve"]=95
)

# 2. Initialize sum and count for average calculation
sum=0
count=0

# 3. Loop through the associative array and display each student’s grade
echo "Student Grades:"
for student in "${!grades[@]}"; do
  grade=${grades[$student]}
  echo "  $student: $grade"
  sum=$(( sum + grade ))
  ((count++))
done

# 4. Calculate and display the average grade
if (( count > 0 )); then
  average=$(( sum / count ))
  echo "Average grade: $average"
else
  echo "No grades to average."
fi


# Exercise 6.4 : Array Manipulation

inputs=()
# 1. Read inputs from the user until they enter 'done'
while true; do
  read -p "Enter a value (or 'done' to finish): " input
  if [[ $input == "done" ]]; then
	break
  fi
  inputs+=("$input")
done	
# 2. Print the inputs
echo "Inputs: ${inputs[*]}"
echo "Inputs:" "${inputs[@]}"

# Ask the user for a value to remove by index 

for i in "${!inputs[@]}"; do
  echo "Index $i: ${inputs[$i]}"
done
echo -n "Enter the index of the value to remove: "
read index
# 3. Remove the value at the specified index
unset "inputs[$index]"
echo "Inputs after removing value at index $index: ${inputs[*]}"
