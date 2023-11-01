#!/bin/bash

mkdir /media/usb/

# HARDWARE SUPPORT
apt install --no-install-recommends -y \
    intel-media-va-driver \
    firmware-iwlwifi

# BASE
apt install --no-install-recommends -y \
    dmenu \
    i3status \
    sway

apt install --no-install-recommends -y \
    gammastep \
    light \
    network-manager \
    pavucontrol \
    pipewire \
    pipewire-pulse \
    rofi

apt install --no-install-recommends -y \
    aria2 \
    bat fd-find \
    curl \
    feh \
    ffmpeg \
    fish \
    fzf \
    kitty \
    mpv \
    openssl \
    ranger \
    shfmt \
    tlp tlp-rdw \
    transmission \
    unzip unrar-free \
    xclip

# CHROME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg --install google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
apt install -f -y

# PROGRAMMING LANGUAGES
apt install --no-install-recommends -y \
    python3-pip black \
    gcc gdb valgrind clangd

# NodeJS & NPM
apt-get update
apt-get install -y ca-certificates curl gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install nodejs -y

# NPM Packages
npm install -g \
    pyright \
    typescript typescript-language-server \
    vscode-langservers-extracted

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# RICE
apt install --no-install-recommends -y \
    arc-theme breeze-cursor-theme papirus-icon-theme \
    lxappearance

# DONE
reboot

