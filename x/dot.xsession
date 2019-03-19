# disable beeping
xset -b

# export lang
export LANG="en_US.UTF-8"

# needed by some java gui application with dwm/xmonad/etc to prevent glitches
export _JAVA_AWT_WM_NONREPARENTING=1

# set keyboard layout
setxkbmap us -variant intl

# remap <ctrl> to <esc>
setxkbmap -option caps:ctrl_modifier

# load fn key bindings
pkill xbindkeys
xbindkeys -f ~/.xbindkeysrc

# load background image
feh --bg-tile ~/.dotfiles/wallpaper/dark_wood.png &

# autolock
xautolock -time 5 -locker slock -corners 0-+0 -cornerdelay 4 -cornerredelay 10 &

(sleep 15s; conky | while read LINE; do xsetroot -name "$LINE"; done) &

# prevents having multiple ssh-agent processes running at the same time
pkill ssh-agent
eval $(ssh-agent -s)

while true; do
    dwm
done
