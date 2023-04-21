#!/bin/bash

# RPM Fusion
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
               https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Gnome Shell
dnf --setopt=install_weak_deps=False --best install -y @base-x \
						       @fonts \
						       gnome-shell \
						       akmod-nvidia \
						       xorg-x11-drv-nvidia-cuda \
						       pipewire-pulseaudio \
                                                       power-profiles-daemon
# Applications
dnf --setopt=install_weak_deps=False --best install -y breeze-cursor-theme \
						       btop \
                                                       curl \
						       eog \
						       gnome-tweaks \
						       gnome-extensions-app \
						       gnome-browser-connector \
                                                       kitty \
                                                       nautilus \
                                                       neovim \

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# Programming Languages
dnf --setopt=install_weak_deps=False --best install -y python3.10 python3-pip

# InvokeAI
wget https://github.com/invoke-ai/InvokeAI/files/11224468/InvokeAI-installer-v2.3.4.post1.zip

# Removing some Packages
dnf remove -y nano vim-minimal

# Reboot
systemctl set-default graphical.target
reboot
