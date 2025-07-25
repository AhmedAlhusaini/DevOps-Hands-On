#!/usr/bin/bash
# List files and directories in /home
ls

# Change into the devops_ninja user’s home subdirectory
cd devops_ninja/

# List contents to verify you’re in the right directory
ls

# Create a new directory named 'my_projects'
mkdir my_projects

# Create five text files named file1different.txt … file5different.txt inside my_projects
touch my_projects/file{1..5}different.txt

# Display the directory tree to confirm file creation
tree

# View the manual page for the 'find' command
man find

# Incorrect attempt (pattern and path order wrong) - shows find usage errors
find -name *.txt /home/
find -name '*.txt' /home/

# Correct find syntax: search starting at home for regular files ending in .txt
find ~ -type f -name "*.txt"

# List current directory contents to reconfirm location
ls

# Create a GZIP-compressed tarball of the my_projects directory
tar -czvf projecs.tar.gz my_projects

# Make a directory for extracting the archive
mkdir ForExtract

# List to show the new ForExtract and the tarball
ls

# Incorrect extraction attempt (wrong flag usage), shows error
tar -xf projecs.tar.gz /ForExtract

# Correct extraction into ForExtract using -C to change directory before extracting
tar -xf projecs.tar.gz -C ForExtract

# Display full tree to verify extracted files
tree

# Compare original and extracted project folders at top level
diff -r ./my_projects/ ./ForExtract/

# Recursively compare contents of the extracted 'my_projects' folder for exact match
diff -r ./my_projects/ ./ForExtract/my_projects/
