#!/usr/bin/env bash 

nitrogen --restore &
telegram-desktop &
discord &
xset r rate 350 60 &
nm-applet &
systemctl --user start clipmenud.service &
picom -b --experimental-backends
steam-native -silent &

# xsetroot -cursor_name left_ptr &
# mpd-discord-rpc &
# wmname compiz &
# setxkbmap -layout us,ru &

pidof "firefox" > /dev/null || firefox &
