#!/usr/bin/bash

# 1. List all environment variables
printenv

# 2. Display only the PATH variable
echo $PATH

# 3. Add an alias to ~/.bashrc (e.g., ll for detailed listing)
echo "alias ll='ls -lah'" >> ~/.bashrc

# 4a. (Optional) Add a simple custom prompt showing user, host, cwd
echo "export PS1='[\u@\h \W]\$ '" >> ~/.bashrc
nano .bashrc
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias hhh='history'
alias lm='ls -iah'
# 5. Reload your shell configuration
source ~/.bashrc	

# Verify the alias and prompt
ll
echo $PS1
hhh
lm
# 6. Display the current shell
echo $SHELL
