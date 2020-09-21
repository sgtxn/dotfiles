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
    for f in $WORKPATH/*;
    do
        now=$(date +%s)
        folder_date=$(stat $f --format=%Y)
        symb=""
        if (( $folder_date+60*60*24*30 < $now )); then # old projects
            symb=""
        else
            symb=""
        fi
        echo "$symb $(basename $f)"
    done
fi
