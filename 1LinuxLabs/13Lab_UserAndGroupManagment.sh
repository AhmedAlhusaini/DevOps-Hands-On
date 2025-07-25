#!/usr/bin/bash
# 1. Display your user account information
id
# or
getent passwd "$(whoami)"

# 2. List all users on the system
cat /etc/passwd 


# 3. Show groups you belong to
groups
groups devops_ninja
groups "$(whoami)"

# or
id -nG

# 4. View first 10 lines of /etc/passwd
head -n 10 /etc/passwd

# 5. Display your shell history
history
