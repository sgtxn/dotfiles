#!/usr/bin/env bash

HOSTNAME=$(cat /etc/hostname)
PCHOST='sgt'
LAPTOPHOST='sgtxn-laptop'

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ $HOSTNAME = $PCHOST ]; then
    polybar pc -r
fi

if [ $HOSTNAME = $LAPTOPHOST ]; then
    polybar laptop -r
fi
