#!/bin/bash

DISCORD_VERSION='0.0.11'

if ! pacman -Qi npm > /dev/null; then
    sudo pacman -S npm
fi

sudo npm install -g asar
asar e /home/sgtxn/.config/discord/$DISCORD_VERSION/modules/discord_desktop_core/core.asar /home/sgtxn/.config/discord/$DISCORD_VERSION/modules/discord_desktop_core/core
rsvg-convert -w 24 -h 24 -f png -a /usr/share/icons/Papirus/24x24/panel/discord-tray.svg > /home/sgtxn/.config/discord/$DISCORD_VERSION/modules/discord_desktop_core/core/app/images/systemtray/linux/tray.png
rsvg-convert -w 24 -h 24 -f png -a /usr/share/icons/Papirus/24x24/panel/discord-tray-unread.svg > /home/sgtxn/.config/discord/$DISCORD_VERSION/modules/discord_desktop_core/core/app/images/systemtray/linux/tray-unread.png
asar p /home/sgtxn/.config/discord/$DISCORD_VERSION/modules/discord_desktop_core/core /home/sgtxn/.config/discord/$DISCORD_VERSION/modules/discord_desktop_core/core.asar
rm -rf /home/sgtxn/.config/discord/$DISCORD_VERSION/modules/discord_desktop_core/core
