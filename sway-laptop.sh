#!/bin/bash

mkdir /media/usb/

# RPM FUSION
dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# WIFI
dnf install -y \
    iwlwifi-mvm-firmware

# BASE
dnf install -y \
    sway \
    kitty \
    i3status \
    intel-media-driver \
    feh \
    fish \
    gammastep \
    light \
    NetworkManager \
    NetworkManager-bluetooth \
    NetworkManager-wifi \
    pavucontrol \
    pipewire \
    pipewire-pulseaudio \
    pulseaudio-utils \
    power-profiles-daemon \
    rofi \
    seatd

dnf install -y \
    podman \
    distrobox \
    firefox \
    ffmpeg \
    fzf \
    mpv \
    mupdf \
    ranger
    
# RICE
dnf install -y \
    breeze-cursor-theme papirus-icon-theme
    
# HOSTNAME
hostnamectl set-hostname thinkpad

# STARSHIP
curl -sS https://starship.rs/install.sh | sh
