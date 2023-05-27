#!/bin/bash

# RPM Fusion
dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Main
dnf --setopt=install_weak_deps=False --best install -y \
	@"base-x" \
	@"Common NetworkManager Submodules" \
	@"Fonts" \
	@"Hardware Support" \
	@"Multimedia" \
	gnome-shell \
	power-profiles-daemon

# Applications
dnf --setopt=install_weak_deps=False --best install -y \
	aria2 \
	bat fd-find \
	breeze-cursor-theme \
	btop \
	curl \
	eog \
	exa \
	fish \
	fzf \
	gnome-browser-connector gnome-extensions-app gnome-tweaks \
	kitty \
	nautilus gvfs-mtp \
	neovim \
	openssl \
	ripgrep \
	transmission \
	unrar \
	vlc \
	yt-dlp \
	yt-dlp-fish-completion

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# VSCode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf install -y code

# Programming Languages
dnf --setopt=install_weak_deps=False --best install -y \
	python3-pip \
	gcc gcc-c++ gdb valgrind \
	nodejs npm

# Starship
curl -sS https://starship.rs/install.sh | sh

# Removing some Packages
dnf remove -y nano vim-minimal

# Reboot
systemctl set-default graphical.target
reboot
