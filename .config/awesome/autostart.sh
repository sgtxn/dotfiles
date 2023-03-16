#!/bin/bash

pgrep -x sxhkd > /dev/null || sxhkd -c ~/.config/sxhkd/sxhkd_shared &
pgrep -x firefox > /dev/null || firefox &
pgrep -x slack > /dev/null || slack &
pgrep -x cbatticon > /dev/null || cbatticon &

xsetroot -cursor_name left_ptr &
xset r rate 350 60 &
wmname compiz &

libinput-gestures-setup start
