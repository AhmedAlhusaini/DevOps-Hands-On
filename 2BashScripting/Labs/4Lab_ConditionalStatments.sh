#!/usr/bin/bash
# Author: Rakesh Yadav
# Date: 2016-05-15
# Description: Conditional Statements
# Version: 1.0
# Usage: ./4Lab_ConditionalStatments.sh
# Input: 
# Output: 


userInputFile=""
read -p "Enter the file name to check: " userInputFile
if [ -f "$userInputFile" ]; then
	echo "File '$userInputFile' exists."
	if [ -r "$userInputFile" ]; then
		echo "File '$userInputFile' is readable."
	else
		echo "File '$userInputFile' is not readable."
	fi
	if [ -w "$userInputFile" ]; then
		echo "File '$userInputFile' is writable."
	else
		echo "File '$userInputFile' is not writable."
	fi
	if [ -x "$userInputFile" ]; then
		echo "File '$userInputFile' is executable."
	else
		echo "File '$userInputFile' is not executable."
	fi	
else
	echo "File '$userInputFile' does not exist."
	read -p "Do you want to create it? (y/n): " createFile
	if [ "$createFile" == "y" ] || [ "$createFile" == "Y" ]; then
		touch "$userInputFile"
		echo "File '$userInputFile' created."
	else
		echo "File creation skipped."
	fi
fi

#Exercise 4.2: Number Comparison
read -p "Enter first number: " num1
read -p "Enter second number: " num2	
# Compare the two numbers
if [ "$num1" -eq "$num2" ]; then
	echo "Both numbers are equal."	
elif [ "$num1" -gt "$num2" ]; then
	echo "First number ($num1) is greater than second number ($num2)."
else
	echo "First number ($num1) is less than second number ($num2)."
fi

# Exercise 4.3: Grade Calculator
read -p "Enter your score (0-100): " score

# Validate that the input is a number between 0 and 100
if ! [[ "$score" =~ ^[0-9]+$ ]] || (( score < 0 || score > 100 )); then
  echo "Error: Please enter a valid integer between 0 and 100."
  exit 1
fi

# Determine the letter grade
if   (( score >= 90 )); then
  grade="A"
elif (( score >= 80 )); then
  grade="B"
elif (( score >= 70 )); then
  grade="C"
elif (( score >= 60 )); then
  grade="D"
else
  grade="F"
fi

# Display the result
echo "Your score: $score"
echo "Your grade: $grade"

# Optional message
case $grade in
  A) echo "Excellent work! 🎉";;
  B) echo "Great job! 👍";;
  C) echo "Good effort. 🙂";;
  D) echo "You passed, but there’s room for improvement.";;&
  F) echo "Unfortunately, you did not pass. 😞";;
esac


# Exercise 4.4: Case Statment Menu
#!/bin/bash

while true; do
  # 1. Display the menu
  echo "Please choose an option:"
  echo "1) Date"
  echo "2) Calendar"
  echo "3) Users"
  echo "4) Exit"
  echo  -n "Enter choice [1-4]: "
  
  # 2. Read user choice
  read  choice
  
  # 3. Handle choice with case
  case "$choice" in
    1)
      echo "Current date and time:"
      date
      ;;
    2)
      echo "This month's calendar:"
      cal
      ;;
    3)
      echo "Logged-in users:"
      who
      ;;
    4)
      echo "Goodbye!"
      break
      ;;
    *)
      echo "Invalid option. Please enter 1, 2, 3, or 4."
      ;;
  esac
  
  # 4. Add a blank line before redisplaying menu
  echo
done



read -p " 
 1) Date
 2) Calendar
 3) Users
 4) Exit
 " choice
 
while [ "$choice" -lt "5" ]; do
  case "$choice" in
  1)
    echo "Current date and time:"
    date
    ;;
  2)
    echo "This month's calendar:"
    cal
    ;;
  3)
    echo "Logged-in users:"
    who
    ;;
  4)
    echo "Goodbye!"
    exit 0
    ;;
  *)
    echo "Invalid option. Please enter 1, 2, 3, or 4."
    ;;
  esac

  # Prompt for input again inside the loop
  read -p $'1) Date\n2) Calendar\n3) Users\n4) Exit\n\nEnter choice: ' choice
done
  


# Initial menu prompt using read
read -p $'1) Date\n2) Calendar\n3) Users\n4) Exit\n\nEnter choice: ' choice

# Enter an infinite loop
while true; do
  # Use select to display and handle the menu
  PS3="Select an option (1-4): "
  select choice in "Date" "Calendar" "Users" "Exit"; do
    case $REPLY in
      1)
        echo "Current date and time:"
        date
        break
        ;;
      2)
        echo "This month's calendar:"
        cal
        break
        ;;
      3)
        echo "Logged-in users:"
        who
        break
        ;;
      4)
        echo "Goodbye!"
        exit 0
        ;;
      *)
        echo "Invalid option. Please enter 1, 2, 3, or 4."
        break
        ;;
    esac
  done

  # After running the choice, pause before re-displaying
  echo
done


# Exercise 4.5 System Requirments Check 
# .............To Be Continued

