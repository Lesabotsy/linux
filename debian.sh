#!/bin/bash

mkdir /media/usb/

# HARDWARE SUPPORT
dnf --setopt=install_weak_deps=False --best install -y \
    intel-media-va-driver \
    firmware-iwlwifi

# BASE
dnf --setopt=install_weak_deps=False --best install -y \
    dmenu \
    i3status \
    sway

dnf --setopt=install_weak_deps=False --best install -y \
    gammastep \
    light \
    network-manager \
    pavucontrol \
    pipewire \
    pipewire-pulse \
    rofi

dnf --setopt=install_weak_deps=False --best install -y \
    aria2 \
    bat fd-find \
    curl \
    feh \
    ffmpeg \
    firefox-esr \
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
dnf --setopt=install_weak_deps=False --best install -y \
    arc-theme breeze-cursor-theme papirus-icon-theme \
    lxappearance

# DONE
reboot

