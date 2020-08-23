#!/usr/bin/env bash

PCHOST='sgt'
TPHOST='t440p'

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ $(hostname) = $PCHOST ]; then
    polybar pc -r
elif [ $(hostname) = $TPHOST ]; then
    polybar tp -r
else
    polybar hp -r
fi
