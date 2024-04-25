#!/bin/bash

mkdir /media/usb/

# RPM FUSION
dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# WIFI
dnf --setopt=install_weak_deps=False --best install -y \
    iwlwifi-mvm-firmware

# BASE
dnf --setopt=install_weak_deps=False --best install -y \
    sway \
    kitty \
    i3status \
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
    ranger \
    rofi    

dnf --setopt=install_weak_deps=False --best install -y \
    podman \
    distrobox \
    ffmpeg \
    firefox \
    intel-media-driver \
    mpv \
    mupdf
    
# RICE
dnf --setopt=install_weak_deps=False --best install -y \
    breeze-cursor-theme papirus-icon-theme \
    lxappearance
    
# HOSTNAME
hostnamectl set-hostname thinkpad

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# DONE
reboot
