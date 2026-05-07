#!/bin/bash

URL="https://discord.com/api/download?platform=linux&format=deb"
TMP_PATH="/tmp"
DISCORD_PATH="${TMP_PATH}/discord.deb"
sudo echo "Killing Discord running processes..."
pkill -xi "discord"
echo "Downloading Discord update..."
wget -q --show-progress -O $DISCORD_PATH $URL
chmod +x $DISCORD_PATH
echo -e "Installing Discord..."
sudo dpkg -i $DISCORD_PATH
