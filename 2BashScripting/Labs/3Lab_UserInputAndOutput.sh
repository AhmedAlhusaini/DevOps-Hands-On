# Exercise 3.1
touch user_profile.sh
echo '#!/bin/bash'                         >> user_profile.sh
echo 'read -p "Enter your name: " name'    >> user_profile.sh
echo 'read -p "Enter your age: " age'      >> user_profile.sh
echo 'read -p "Enter your city: " city'    >> user_profile.sh
echo 'echo "Profile: $name, $age, $city"'   >> user_profile.sh
chmod +x user_profile.sh

# Exercise 3.2
touch password_demo.sh
echo '#!/bin/bash'                        >> password_demo.sh
echo 'read -p "Username: " user'         >> password_demo.sh
echo 'read -s -p "Password: " pass; echo'>> password_demo.sh
echo 'echo "Username is: $user"'         >> password_demo.sh
chmod +x password_demo.sh




### Exercise 3.3 Age Validator 
# !/usr/bin/bash
# This script validates the age of the user
# It checks if the age is greater than 18
# If the age is greater than 18, it prints "You are eligible to vote"
# If the age is less than 18, it prints "You are not eligible to vote"

read -p "Please enter your age: " age
if [[ $age =~ ^[0-9]+$ ]]; then
	if (( age >= 27 )); then
		echo "You are Senior Citizen."
	elif (( age >= 18 && age < 27 )); then
		echo "You are an Adult."
	elif (( age >= 13 && age < 18 )); then
		echo "You are a Teen."
	elif (( age >= 0 && age < 13 )); then
		echo "You are a Child."
	fi
else
	echo "Invalid input. Please enter a valid age. In Numbers only."
fi


# Keep asking until a valid numeric age is entered, then categorize

while true; do
  # Prompt for age
  read -p "Enter your age: " age

  # Check if input is one or more digits
  if [[ "$age" =~ ^[0-9]+$ ]]; then
    break
  else
    echo "Invalid input. Please enter a number."
  fi
done

# Categorize based on age
if   (( age < 13 )); then
  echo "You are a child."
elif (( age < 20 )); then
  echo "You are a teen."
elif (( age < 65 )); then
  echo "You are an adult."
else
  echo "You are a senior."
fi


while [[ ! "$age" =~ ^[0-9]+$ ]]; do
    echo "Invalid input. Please enter a number."
  read -p "Enter your age: " age
done	

# Categorize based on age
if   (( age < 13 )); then
  echo "You are a child."
elif (( age < 20 )); then
  echo "You are a teen."
elif (( age < 65 )); then
  echo "You are an adult."
else
  echo "You are a senior."
fi


until [[ "$age" =~ ^[0-9]+$ ]]; do
  read -p "Please enter your age: " age
  if [[ ! "$age" =~ ^[0-9]+$ ]]; then
	echo "Invalid input. Please enter a valid age in numbers only."
  fi
done

# Categorize based on age
if   (( age < 13 )); then
  echo "You are a child."
elif (( age < 20 )); then
  echo "You are a teen."
elif (( age < 65 )); then
  echo "You are an adult."
else
  echo "You are a senior."
fi





# Exercise 3.4
touch file_operations.sh
echo '#!/bin/bash'                                                       >> file_operations.sh
echo 'echo "Initial content" > output.txt'                               >> file_operations.sh
echo 'echo "Appended content" >> output.txt'                             >> file_operations.sh
echo 'echo "----- output.txt -----"'                                     >> file_operations.sh
echo 'cat output.txt'                                                    >> file_operations.sh
echo 'ls /nonexistent 2>> >(while read l; do echo "$(date +"%F %T") $l"; done >> errors.log)' >> file_operations.sh
echo 'echo "Errors are in errors.log"'                                   >> file_operations.sh
chmod +x file_operations.sh
