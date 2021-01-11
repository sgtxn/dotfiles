#!/usr/bin/bash

if [ ! -z "$@" ]
then
    bluetoothctl power on
    bluetoothctl disconnect
    ADDR=$(echo $@ | grep -Po "(\w{2}:)+\w{2}")
    bluetoothctl connect $ADDR
else
    bluetoothctl devices
fi
