#!/bin/bash

mkdir /media/usb/

# RPM FUSION
dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# WIFI
dnf --setopt=install_weak_deps=False --best install -y \
    iwl7260-firmware

# VAAPI
dnf --setopt=install_weak_deps=False --best install -y \
    intel-media-driver

# BASE
dnf --setopt=install_weak_deps=False --best install -y \
    @fonts \
    dmenu \
    i3status \
    sway

dnf --setopt=install_weak_deps=False --best install -y \
    gammastep \
    light \
    NetworkManager \
    NetworkManager-wifi \
    pavucontrol \
    pipewire \
    pipewire-pulseaudio \
    power-profiles-daemon \
    pulseaudio-utils \
    rofi

dnf --setopt=install_weak_deps=False --best install -y \
    aria2 \
    bat \
    curl \
    feh \
    ffmpeg \
    fish \
    fzf \
    helix \
    kitty \
    mpv \
    mupdf \
    openssl \
    ranger \
    shfmt \
    transmission \
    unrar \
    xclip

# CHROME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# RICE
dnf --setopt=install_weak_deps=False --best install -y \
    arc-theme breeze-cursor-theme papirus-icon-theme \
    lxappearance

# PROGRAMMING STUFF
dnf --setopt=install_weak_deps=False --best install -y \
    black \
    clang-tools-extra \
    gcc \
    gcc-c++ \
    gdb \
    nodejs \
    npm \
    python3-pip \
    valgrind

npm install -g \
    pyright \
    typescript \
    typescript-language-server \
    vscode-langservers-extracted

# HOSTNAME
hostnamectl set-hostname thinkpad

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# DONE
reboot
