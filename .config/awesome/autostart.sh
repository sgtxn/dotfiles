#!/usr/bin/env bash 

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run firefox
run telegram-desktop
run discord
run nm-applet
run picom -b --experimental-backends

# setxkbmap -layout us,ru &
# xsetroot -cursor_name left_ptr &
# run nitrogen --restore

xset r rate 350 60 &
systemctl --user start clipmenud.service &
wmname compiz &
pidof "steam" > /dev/null || steam-native -silent &
