# command aliases
alias ls='ls -FG --color'
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

# safe copy and move
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I'

# cd and ls hurrah
c(){ cd "$@" && ls;}

g() {
  if [[ $# == '0' ]]; then
    git s
  else
    git "$@"
  fi
}

alias fbranch='git co $(git branch | fzf)'

alias vim='nvim'

# vim convenience bindings
v() {
  vim -p "$@"
}

vp() {
  vim -p *$@
}
