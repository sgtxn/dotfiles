#!/usr/bin/env bash 

xset r rate 350 60 &
xsetroot -cursor_name left_ptr &
nitrogen --restore &
picom -b --experimental-backends

nm-applet &
blueman-applet &

systemctl --user start clipmenud.service &
telegram-desktop &
GDK_SCALE=2 steam-native -silent &

# mpd-discord-rpc &
# wmname compiz &

pidof "firefox" > /dev/null || firefox &
if [ $(date +%u) -lt 6 ]; then slack & else discord & fi
