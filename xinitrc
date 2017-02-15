#!/bin/sh

xrdb -merge ~/.Xresources

setxkbmap -option ctrl:nocaps
stalonetray &
xscreensaver -no-splash &
   
exec xmonad
