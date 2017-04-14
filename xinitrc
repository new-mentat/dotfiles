#!/bin/sh

xrdb -merge ~/.Xresources

setxkbmap -option ctrl:nocaps
xscreensaver -no-splash &

eval $(ssh-agent -s)
exec xmonad
