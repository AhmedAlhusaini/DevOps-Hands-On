# 🧪 Lab: Finding Your System Information

## 📝 Task

> Discover information about your Linux system:
> - Find out who you are currently logged in as  
> - Display your user ID and group memberships  
> - Show your current working directory  
> - Display the contents of your `.bashrc` file (if it exists)  
> - List all hidden files in your home directory  

---

## ✅ Steps

1. Identify the current username.  
2. Retrieve your UID, GID, and supplementary groups.  
3. Print the full path of your current directory.  
4. View the `.bashrc` file if it exists in your home directory.  
5. List all files beginning with a dot in your home directory.  

---

## 💡 Bonus

- Use `whoami` vs. `logname` and note the difference when using `sudo`.  
- If `.bashrc` is missing, explain how you’d create a default one.  
- Explore `lsattr` on hidden files to see extended attributes.  

---

## 💻 Command(s)

```bash
ubuntu@UbuntUmachine:~$ ls
hello.sh  my_projects  new.sh  new.txt  newnew.sh  secret.txt
ubuntu@UbuntUmachine:~$ whoami
ubuntu
ubuntu@UbuntUmachine:~$ who
ubuntu   pts/0        2025-07-24 17:18 (154.184.75.129)
ubuntu@UbuntUmachine:~$ id ubuntu
uid=1000(ubuntu) gid=1000(ubuntu) groups=1000(ubuntu),4(adm),24(cdrom),27(sudo),30(dip),105(lxd)
ubuntu@UbuntUmachine:~$ pwd
/home/ubuntu
ubuntu@UbuntUmachine:~$ cat .bashrc
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
ubuntu@UbuntUmachine:~$ ls -a
.   .Xauthority    .bash_logout  .cache   .lesshst  .profile         .ssh                       .viminfo  my_projects  new.txt    secret.txt
..  .bash_history  .bashrc       .config  .local    .python_history  .sudo_as_admin_successful  hello.sh  new.sh       newnew.sh
ubuntu@UbuntUmachine:~$ ls -ial
total 152
262333 drwxrwxrwx 7 ubuntu ubuntu  4096 Jul 24 17:46 .
  1730 drwxr-xr-x 4 root   root    4096 Jul 24 13:54 ..
294258 -rw------- 1 ubuntu ubuntu   301 Jul 24 17:18 .Xauthority
262428 -rw------- 1 ubuntu ubuntu 77721 Jul 24 16:07 .bash_history
262335 -rw-r--r-- 1 ubuntu ubuntu   220 Mar 31  2024 .bash_logout
262336 -rw-r--r-- 1 ubuntu ubuntu  3771 Mar 31  2024 .bashrc
262361 drwx------ 2 ubuntu ubuntu  4096 Jul  8 17:57 .cache
294169 drwx------ 7 ubuntu ubuntu  4096 Jul  9 16:05 .config
294244 -rw------- 1 ubuntu ubuntu    45 Jul 24 15:25 .lesshst
294167 drwxr-xr-x 3 ubuntu ubuntu  4096 Jul  9 15:59 .local
262334 -rw-r--r-- 1 ubuntu ubuntu   807 Mar 31  2024 .profile
262354 -rw------- 1 ubuntu ubuntu    57 Jul 18 12:25 .python_history
262338 drwx------ 2 ubuntu ubuntu  4096 Jul  8 17:56 .ssh
262363 -rw-r--r-- 1 ubuntu ubuntu     0 Jul  8 17:58 .sudo_as_admin_successful
294238 -rw------- 1 ubuntu ubuntu  8241 Jul 24 14:27 .viminfo
294245 -rwxr--r-x 1 ubuntu ubuntu    44 Jul 24 15:46 hello.sh
262355 drwxrwxr-x 6 ubuntu ubuntu  4096 Jul 24 14:11 my_projects
294254 -rwxr--r-x 1 ahmed  zien      44 Jul 24 17:45 new.sh
294253 -rw-r--r-- 1 ahmed  zien       6 Jul 24 17:45 new.txt
294255 -rw-rw---x 1 ubuntu ubuntu     0 Jul 24 17:46 newnew.sh
262431 -rwx------ 1 ubuntu ubuntu     0 Jul 24 15:37 secret.txt

