#!/usr/bin/bash

# Exercise 5.1 Basic Loop 

for i in {1..10}
do
	if [ $i -eq 10 ]; then
		echo "Reached $i"
    else
		echo " Count : $i"
	fi
done


# Exercise 5.2 File Processing Loop 
index=1
for file in *.txt
do
	#cp "$file" "$file.bak"
	# I have noticed here that files output is file3.txt.bak while i understand that task need one extension .bak
	cp $file "${file:-3}" 
	cp "${file:-3}" "${file:-3}.bak.1"
	cp $file "${file%.*}" 
	cp  "${file%.*}"  "${file%.*}.bak.2"
	echo "$index: $file --> BackupName Is ${file:-3}.bak.1 -- ${file%.*}.bak.2"
	index=$((index+1))
done

# Exercise 5.3 Gussing Game Loop
#!/bin/bash
# guessing_game.sh – A simple number guessing game

# Generate a random target number between 1 and 10
target=$(( RANDOM % 10+1 ))
echo "The target number is $target."

# Initialize attempt counter
attempts=0

echo "Welcome to the Guessing Game!"
echo "I'm thinking of a number between 1 and 10."

# Loop until the user guesses correctly
while true; do
  # Prompt for the user's guess
  read -p "Enter your guess: " guess

  # Increment the attempt counter
  (( attempts++ ))

  # Check if the guess is a valid number
  if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
    continue
  fi

  # Provide hints or end the game
  if (( guess < target )); then
    echo "Higher!"
  elif (( guess > target )); then
    echo "Lower!"
  else
    echo "Congratulations! You guessed it in $attempts attempts."
    break
  fi
done

# Exercise 5.4 Until Loop Example 

#...........To Be Continued 

# Exercise 5.5 Nested Loops 

#...........To Be Continued 
