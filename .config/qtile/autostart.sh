#!/usr/bin/env bash 

nitrogen --restore &
telegram-desktop &
discord &
# xsetroot -cursor_name left_ptr &
xset r rate 350 60 &
nm-applet &
# wmname compiz &
# setxkbmap -layout us,ru &
systemctl --user start clipmenud.service &

picom -b --experimental-backends
steam-native -silent &
mpd-discord-rpc &

pidof "firefox" > /dev/null || firefox &
