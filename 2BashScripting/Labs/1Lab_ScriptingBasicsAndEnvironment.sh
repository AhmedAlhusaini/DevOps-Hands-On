#!/usr/bin/bash
# Lab: Scripting Basics and Environment

# Scripting Basics & Preparation of the Lab
# 1. Create a file named hello.sh with the following content:
# 2. Make the file executable by running chmod +x hello.sh
# 3. Run the file by executing ./hello.sh
# 4. Create a directory named /tmp/hello and move the hello.sh file into it.
# 5. Run the hello.sh file from the /tmp/hello directory.
# 6. Create a file named hello.sh in the current directory and add the same content as in step 1.
# 7. Move the hello.sh file to the /

#Exercise 1.1: Your First Script
dir=$(pwd)
touch "$dir/hello.sh"
chmod +x "$dir/hello.sh"
echo "Hello World!" 

#Exercise 1.2: Script Permissions
echo '#!/usr/bin/bash' > "$dir/hello.sh"
echo 'echo "Hello World!"' >> "$dir/hello.sh"
chmod +x "$dir/hello.sh"
./hello.sh

#Exercise 1.3: Script with Comments

echo '#!/usr/bin/bash' > "$dir/info.sh"
echo '# This is a simple script' >> "$dir/info.sh"
echo 'echo "Hello World!"' >> "$dir/info.sh"
echo '"Current Date Is $(date)"' >> "$dir/info.sh"
echo '"Current Time Is $(date +"%H:%M:%S")"' >> "$dir/info.sh"
echo '"Current Date and Time Is $(date +"%d/%m/%Y %H:%M:%S")"' >> "$dir/info.sh"
echo '"Current Timezone Is $(date +"%Z")"' >> "$dir/info.sh"
echo '"Current Timezone Offset Is $(date +"%z")"' >> "$dir/info.sh"
echo '"Current Hostname Is $(hostname)"' >> "$dir/info.sh"
echo '"Current User Is $(whoami)"' >> "$dir/info.sh"
echo '"Current Working Directory Is $(pwd)"' >> "$dir/info.sh"
echo '"Current Shell Is $SHELL"' >> "$dir/info.sh"
echo '"Current Username Is $USER"' >> "$dir/info.sh"
chmod +x "$dir/info.sh"


#Exercise 1.4: Exit Codes
#Exercise 1.5: Basic Debugging
touch "$dir/debug.sh"
echo '#!/usr/bin/bash' > "$dir/debug.sh"
echo 'echo "This is a debug script"' >> "$dir/debug.sh"
echo 'set -x' >> "$dir/debug.sh"
echo 'echo "This is a debug script"' >> "$dir/debug.sh"
echo 'mkdir Debugging' >> "$dir/debug.sh"
echo ' touch Debugging/debug.txt' >> "$dir/debug.sh"
echo ' cd Debugging' >> "$dir/debug.sh"
echo ' echo "Debugging in progress..."' >> "$dir/debug.sh"
echo ' ls -l' >> "$dir/debug.sh"
echo ' set +x' >> "$dir/debug.sh"
chmod +x "$dir/debug.sh"


#Those Will be handled by Terminal 

./info.sh
./debug.sh

# 8. Create a symbolic link to the hello.sh file in the /tmp directory.
