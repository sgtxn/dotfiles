#!/usr/bin/bash

if [ ! -z "$@" ]
then
    bspc node $(bspc query -N -d code | head -n 1) -c
    PROJECT=$@
    cd $WORKPATH/$PROJECT
    code .
    bspc config split_ratio 0.77
    sleep 1
    coproc (alacritty --working-directory=$WORKPATH/$PROJECT)
    sleep 0.5
    bspc config split_ratio 0.55
else
    ls $WORKPATH
fi
