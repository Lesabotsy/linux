#!/bin/bash

# RPM Fusion
dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Base
dnf install -y \
	gnome-shell \
 	gnome-tweaks \
	gnome-extensions-app \
	gnome-browser-connector \
 	nautilus \

# Applications
dnf --setopt=install_weak_deps=False --best install -y \
	acpi \
	aria2 \
 	breeze-cursor-theme \
	curl \
 	eog \
	ffmpeg \
	feh \
	fish \
	fzf \
	kitty \
	mpv \
	openssl \
	transmission \
	unrar

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# VSCode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf install -y code

# Starship
curl -sS https://starship.rs/install.sh | sh

# Removing some Packages
dnf remove -y vim-minimal

# Reboot
systemctl set-default graphical.target
reboot
