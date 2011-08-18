#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
xset +fp /usr/share/fonts/local
xset fp rehash
numlockx & 
xmodmap ~/.Xmodmap
xscreensaver -nosplash &
exec xmonad
~/scriptorium/xwrits_init
