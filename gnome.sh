#!/bin/bash

# RPM Fusion
dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Main
dnf --setopt=install_weak_deps=False --best install -y \
	@base-x \
	@"Common NetworkManager Submodules" \
	@Fonts \
	@"Hardware Support" \
	@Multimedia \
	gnome-shell \
	gnome-session-xsession \
	power-profiles-daemon

# Applications
dnf --setopt=install_weak_deps=False --best install -y \
	aria2 \
	bat \
	breeze-cursor-theme \
	btop \
	curl \
	eog \
	exa \
	ffmpeg \
	fd-find \
	fish \
	fzf \
	gnome-tweaks \
	gnome-extensions-app \
	gnome-browser-connector \
	kitty \
	mpv \
	mupdf \
	neovim \
	openssl \
	ranger \
	ripgrep \
	transmission \
	unrar \
	yt-dlp \
	yt-dlp-fish-completion

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# Programming Languages
dnf --setopt=install_weak_deps=False --best install -y \
	python3-pip \
	java-17-openjdk-devel \
	gcc gcc-c++ gdb valgrind \
	nodejs npm

# Starship
curl -sS https://starship.rs/install.sh | sh

# Removing some Packages
dnf remove -y nano vim-minimal

# Reboot
systemctl set-default graphical.target
reboot
