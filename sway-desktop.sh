#!/bin/bash

mkdir /media/usb/

# RPM FUSION
dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# WIFI
dnf --setopt=install_weak_deps=False --best install -y \
    mt7xxx-firmware

# BASE
dnf --setopt=install_weak_deps=False --best install -y \
    @fonts \
    dmenu \
    i3status \
    sway

dnf --setopt=install_weak_deps=False --best install -y \
    bat \
    distrobox \
    fd-find \
    feh \
    ffmpeg \
    firefox \
    fish \
    fzf \
    gammastep \
    helix \
    intel-media-driver \
    kitty \
    mpv \
    mupdf \
    NetworkManager \
    NetworkManager-wifi \
    pavucontrol \
    pipewire \
    pipewire-pulseaudio \
    podman \
    power-profiles-daemon \
    pulseaudio-utils \
    ranger \
    rofi \
    shfmt \
    unrar
    
# RICE
dnf --setopt=install_weak_deps=False --best install -y \
    breeze-cursor-theme papirus-icon-theme \
    lxappearance
    
# HOSTNAME
hostnamectl set-hostname desktop

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# DONE
reboot
