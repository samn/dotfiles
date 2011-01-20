#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
numlockx & 
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
xscreensaver -nosplash &
exec xmonad
~/scriptorium/xwrits_init
