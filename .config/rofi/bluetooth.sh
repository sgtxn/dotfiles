#!/usr/bin/bash

if [ ! -z "$@" ]
then
    bluetooth disconnect
    ADDR=$(echo $@ | grep -Po "(\w{2}:)+\w{2}")
    bluetoothctl connect $ADDR
else
    bluetoothctl devices
fi
