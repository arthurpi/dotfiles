#!/bin/sh

#disable beeps
xset -b

#remap lalt/lsuper, caps/escape
xmodmap .xmodmaprc
setxkbmap -option caps:escape

export LANG=en_US.UTF-8

#us altgr-intl layout
setxkbmap us -variant altgr-intl

#uptime/date on dwm statusbar
while true; do
  xsetroot -name "Battery $(acpi | awk '{print substr($4, 0)}') > Date $(date "+%d/%m  %H:%M")"
  sleep 60
done &


#automatic slock
xautolock -time 5 -locker slock -corners 0-+0 -cornerdelay 4 -cornerredelay 10 &

#run window manager
exec dwm
