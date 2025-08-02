#!/usr/bin/bash
# echo "Hello, World!"
# echo "This is a basic Bash script."
# 
# if [ -f "00-Learning Basics" ]; then
# 	echo "file exists in the 00-Learning Basics directory."
# else
# 	echo "file does not exist in the 00-Learning Basics directory."
# fi
# 
# echo "A     $0"
# if [[ $0 =~ ^.+s$ ]]; then
# 	echo "The script name starts with '00'."
# else
# 	echo "The script name does not start with '00'."
# fi
# 
# case $0 in
# 	*00-Learning*)
# 		echo "The script name contains '00-Learning'."
# 		;;
# 	*)
# 		echo "The script name does not contain '00-Learning'."
# 		;;
# esac

# myCourse="Bash Scripting Basics"
# echo "My course is: $myCourse"
# echo "The course name has ${#myCourse} characters."
# 
# myArray=("Bash" "Scripting" "Basics")
# echo "The first element of myArray is: ${myArray[0]}"
# echo "The length of the first element of myArray is: ${#myArray[0]}"
# echo "The second element of myArray is: ${myArray[1]}"
# echo "The third element of myArray is: ${myArray[2]}"
# echo "The length of myArray is: ${#myArray[@]}"
# echo "The elements of myArray are: ${myArray[*]}"
# echo "The elements of myArray are: ${myArray[@]}"
# echo "The elements of myArray are: ${myArray[@]:1:2}"
# echo " The Index of my array is: ${!myArray[@]}"
# 
# 
# for course in "${myArray[@]}"; do
# 	echo "Course: $course"
# done

# myIps=()
# read -p "Enter IP addresses (1-5): " -a myIps
# # for ip in "${myIps[@]}"; do
# # 	echo "IP Address: $ip"
# # done
# echo "The IP addresses entered are: ${myIps[@]}"
# set -x # set -x
# echo "Debugging mode is ON. Commands will be printed as they are executed."
# select myIp in "${myIps[@]}"; do
# 	echo "You selected: $myIp"
# 	echo $(ping "$myIp")
# 	if [[ $? -eq 0 ]]; then
# 		echo "Ping successful!"
# 	else
# 		echo "Ping failed!"
# 	fi
# 	echo "Exiting the selection loop."
# 	break
# done

# while IFS=: read -r line; do
# 	echo "Line: $line"
# done < passwd


# read -p "Enter Your Name: " name
# if [[ -z $name ]]; then
# 	echo "Name cannot be empty."
# 	echo ${name:-"Hacker"}
# else
# 	echo "Hello, $name"
# fi
# 
# file="passwd"
# for line in $(cat $file); do
# 	echo "Line: $line"
# done

declare -A person
person[name]="Ahmed"
person[age]=25
person[gender]="Male"
person[country]="Egypt"
person[city]="Cairo"
person[occupation]="Software Engineer"
person[skills]="Python, JavaScript, Java, C++, C, PHP, SQL, HTML, CSS"
person[interests]="Reading, Traveling, Cooking, Gardening, Photography, Music, Sports, Gaming, etc."
person[address]="123 Main Street, City, Country"
person[phone]="(123) 456-7890"
person[email]="ahmed@example.com"
person[website]="https://www.example.com"

# echo "Name: ${person[name]}"
# echo "Age: ${person[age]}"
# echo "Gender: ${person[gender]}"
# echo "Country: ${person[country]}"
# echo "City: ${person[city]}"
# echo "Occupation: ${person[occupation]}"
# echo "Skills: ${person[skills]}"
# echo "Interests: ${person[interests]}"
# echo "Address: ${person[address]}"
# echo "Phone: ${person[phone]}"
# echo "Email: ${person[email]}"
# echo "Website: ${person[website]}"

echo "The Array Items are: ${person[@]}"
echo "The Array Length is: ${#person[@]}"

select key in "${!person[@]}"; do
	echo "Key: $key"
	echo "Value: ${person[$key]}"
done

