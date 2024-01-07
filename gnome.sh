#!/bin/env bash

# RPM FUSION
dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf install -y \
    bat \
    distrobox \
    fd-find \
    firefox \
    fish \
    fzf \
    helix \
    gnome-console \
    gnome-shell \
    gnome-shell-extension-user-theme \
    nautilus \
    podman \
    power-profiles-daemon \
    shfmt \
    unrar

dnf install -y \
    adw-gtk3-theme \
    gnome-tweaks
    
dnf remove -y \
    gnome-tour \
    nano \
    vim-minimal
    
hostnamectl set-hostname desktop
systemctl set-default graphical.target
reboot
