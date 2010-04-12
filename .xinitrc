#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
numlockx & 
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
exec xmonad
xwrits typetime=5 breaktime=1 +breakclock +mouse +top after=7 breaktime=2 +clock +lock &
xwrits typetime=30 breaktime=10 +breakclock +mouse +top after=33 breaktime=13 +finger +clock +lock &
