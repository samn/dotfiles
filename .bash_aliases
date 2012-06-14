#command aliases
alias ls='ls --color=auto'
alias ..='cd ..;ls;'
alias ...='cd ../..;ls;'
alias ....='cd ../../..;ls;'
alias ll='ls -lh;'
alias lla='la -lAh'
alias la='ls -A;'
alias k='kill'
alias ka='killall'
alias sd='sudo shutdown -h now'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias df='df -h'
alias top='htop'

#safe copy and move
#alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I'

#cd and ls hurrah
c(){ cd "$@" && ls;}

#ssh key stuff
alias keyon="ssh-add -t 10800"
alias keyoff='ssh-add -D'
alias keylist='ssh-add -l'

#pacman aliass
alias sps='sudo pacman -S'
#alias pup='sudo pacman -Syu'
alias pup='yaourt -Syu --aur'

#alias sqlplus='rlwrap sqlplus'

g() {
  if [[ $# == '0' ]]; then
    git status
  else
    git "$@"
  fi
}
                                                                                                                                                                                   
# vim convenience bindings                                                                                                                                                         
v() {
  vim -p "$@"
}

vp() {
  vim -p *$@
}
