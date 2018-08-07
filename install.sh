#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
  rsync --exclude ".git/" \
    --exclude "install.sh" \
    --exclude "i3lock.service" \
    -avh --no-perms . ~;
  [ -d "/etc/systemd/system" ] && sudo cp i3lock.service /etc/systemd/system/i3lock.service
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
