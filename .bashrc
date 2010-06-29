# Check for an interactive session
[ -z "$PS1" ] && return

#PS1='[\u@\h \W]\$ '
PS1='[\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[m\]] \[\e[1;32m\]\$ \[\e[m\] '

#history: ignore duplicate lines, and those begining with space
export HISTCONTROL=ignoreboth

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#only have to tab once for possible completions
set show-all-if-ambiguous on

#even more pretty colors in ls
eval `dircolors -b`

#silence the fucking bell
setterm -blength 0

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#path and envvars
export PATH=$PATH:$JAVA_HOME/bin/:/usr/local/flex/bin:/home/sneubardt/scriptorium:/usr/local/bin:/opt/NX/bin

#colorize less output, nice for man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export GREP_COLOR="1;33"

export JAVA_HOME=/usr/local/jdk

#so p4 automatically picks up the correct client
export P4CONFIG=p4config.txt
export P4DIFF=vimdiff

export EDITOR=vim

#aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases 
fi

#brightcove specific stuff 
if [ -f ~/.bc_bashrc ]; then
    . ~/.bc_bashrc 
fi

SSHAFILE=/tmp/.$(whoami)-ssha
if [ -f $SSHAFILE ]; then
    . $SSHAFILE
else
    eval `ssh-agent |head -n 2| tee $SSHAFILE`
    chmod 600 $SSHAFILE
fi

