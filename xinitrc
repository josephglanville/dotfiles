#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#Setup .Xresources
xrdb ~/.Xresources
#Set mouse cursor
xsetroot -cursor_name left_ptr
#Start xcompmgr for transparency effects etc.
xcompmgr&
#Set background to ~/wallpaper.png
feh --bg-scale ~/.wallpaper.png&
#Start trayer
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --height 12 --transparent true --tint 0x000000 &
#Start Wicd Client
wicd-client&
#exec openbox-session
#exec evilwm
#exec ratpoison
exec xmonad
