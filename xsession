#!/bin/sh

#load fonts (fbsd)
#xset +fp /usr/local/lib/X11/fonts/terminus-font/
#xset fp rehash

#remap lalt/lsuper, caps/escape
xmodmap .xmodmaprc
setxkbmap -option caps:escape

#us altgr-intl layout
setxkbmap us -variant altgr-intl

#date on dwm statusbar
#while true; do
#  xsetroot -name "Uptime $(uptime | awk '{print substr($3, 0, (length($3) - 1))}') > Date $(date "+%d/%m  %H:%M")"
#  sleep 60
#done &

#automatic slock
xautolock -time 5 -locker slock -corners 0-+0 -cornerdelay 4 -cornerredelay 10 &
#run wm
exec /usr/bin/dwm
