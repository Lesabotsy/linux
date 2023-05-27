#!/bin/bash

mkdir /media/usb/

# RPM FUSION
dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# HARDWARE SUPPORT
dnf --setopt=install_weak_deps=False --best install -y \
	intel-media-driver \
	iwl7260-firmware

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
	rofi

dnf --setopt=install_weak_deps=False --best install -y \
	aria2 \
	bat \
	curl \
	exa \
	fd-find \
	feh \
	ffmpeg \
	fish \
	fzf \
	kitty \
	mpv \
	mupdf \
	neovim \
	openssl \
	ripgrep \
	ranger \
	transmission \
	unrar \
	xclip \
	yt-dlp \
	yt-dlp-fish-completion

# CHROME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# SETUP
dnf --setopt=install_weak_deps=False --best install -y \
	python3-pip \
	java-latest-openjdk-devel \
	gcc gcc-c++ gdb valgrind \
	nodejs npm

# RICE
dnf --setopt=install_weak_deps=False --best install -y \
	arc-theme \
	breeze-cursor-theme \
	lxappearance \
	papirus-icon-theme

# MISC

# HOSTNAME
hostnamectl set-hostname thinkpad

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# DONE
reboot
