#!/user/bin/bash


#Exercise 2.1: Basic Variables

myName="Alhusainy"
myAge=35
myFavColor="Blue"

echo -e " Hello $myName  , you Faviorite Color Is $myFavColor and your age is $myAge"
echo -e " Hello ${myName} , you Faviorite Color Is ${myFavColor} and your age is ${myAge}"
printf " Hello %s , you Faviorite Color Is %s and your age is %s\n" "$myName" "$myFavColor" "$myAge"

#Exercise 2.2: Command Substitution
echo -e "The current date is: $(date)"
echo -e "The current user is: $(whoami) | From $USER"
echo -e "The current working directory is: $(pwd)"	
echo " Number of Files is : $(ls -al | wc -l)" 
echo "$(du -sh "$PWD")"  


#Exercise 2.3: Environment vs Shell Variables
#!/usr/bin/bash
Local_var="Local Variable"
GLOBAL_VAR="global"

export GLOBAL_VAR
echo "Local Variable is $Local_var"
echo "Global Variable is $GLOBAL_VAR"

touch child_Scrip.sh
chmod 777 child_Scrip.sh

echo '#!/usr/bin/bash' >> child_Scrip.sh
echo 'echo "Local Variable is $Local_var"' >> child_Scrip.sh
echo 'echo "Global Variable is $GLOBAL_VAR"' >> child_Scrip.sh
echo 'echo "Child script executed with variables:"' >> child_Scrip.sh 
echo "Executing child script..."
bash child_Scrip.sh
echo "Child script executed."

#Exercise 2.4: Special Variables
touch special_vars.sh
echo '#!/bin/bash' >> special_vars.sh
echo 'echo "Script Name: $0"' >> special_vars.sh
echo 'echo "All Arguments: $@"' >> special_vars.sh
echo 'echo "Number of Arguments: $#"' >> special_vars.sh
echo 'echo "Argument 1: $1"' >> special_vars.sh
echo 'echo "Argument 2: $2"' >> special_vars.sh
echo 'echo "Argument 3: $3"' >> special_vars.sh

chmod +x special_vars.sh
./special_vars.sh apple banana cherry


#Exercise 2.5: Default Values for Variables
touch defaults.sh
echo '#!/bin/bash' >> defaults.sh

echo 'username=${1:-guest}' >> defaults.sh
echo 'greeting=${2:-Hello}' >> defaults.sh
echo 'echo "$greeting, $username!"' >> defaults.sh

chmod +x defaults.sh

# Run with 0 args
./defaults.sh

# Run with 1 arg
./defaults.sh ahmed

# Run with 2 args
./defaults.sh Alhusiny Salaam


