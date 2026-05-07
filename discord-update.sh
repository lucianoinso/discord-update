#!/bin/bash
TMP_PATH="/tmp"
DISCORD_PATH="${TMP_PATH}/discord.deb"


get_latest_discord_version() {
    local url
    url=$(curl -Ls -o /dev/null -w '%{url_effective}' \
        "https://discord.com/api/download/stable?platform=linux&format=deb")
    basename "$url" .deb | sed 's/^discord-//'
}

get_installed_version() {
    dpkg-query -W -f='${Version}' discord 2>/dev/null || echo "0"
}

update_available() {
  local installed_version=$(get_installed_version)
  local latest=$(get_latest_discord_version)
  echo "Installed: $installed_version"
  echo "Latest:    $latest"
  dpkg --compare-versions "$latest" gt "$installed_version"
}

download_and_install() {
  URL="https://discord.com/api/download?platform=linux&format=deb"
  sudo echo "Stopping Discord..." # We sudo here so that the user doesn't have
                                  # to wait for the file to download.
  pkill -xi "discord"
  echo "Downloading update..."
  wget -q --show-progress -O $DISCORD_PATH $URL
  chmod +x $DISCORD_PATH
  echo -e "Installing..."
  sudo dpkg -i $DISCORD_PATH
}

echo "Checking if update available..."

if update_available; then
    download_and_install
    echo "Discord updated successfully!"
else
    echo "Discord is up to date."
fi
