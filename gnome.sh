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
    kitty \
    gnome-shell \
    gnome-shell-extension-user-theme \
    nautilus \
    podman \
    power-profiles-daemon \
    shfmt \
    unrar

dnf install -y \
    adw-gtk3-theme \
    breeze-cursor-theme \
    gnome-tweaks

hostnamectl set-hostname desktop
systemctl set-default graphical.target
reboot
