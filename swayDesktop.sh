#!/bin/bash

mkdir /media/usb/

# RPM FUSION
dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# BASE
dnf --setopt=install_weak_deps=False --best install -y \
	@fonts \
	pavucontrol \
	pipewire \
	pipewire-pulseaudio \
	power-profiles-daemon \
	rofi \
	sway

dnf --setopt=install_weak_deps=False --best install -y \
	aria2 \
	bat \
	curl \
	exa \
	fd-find \
	ffmpeg \
	fish \
	fzf \
	kitty libwayland-egl \
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
	java-17-openjdk-devel \
	gcc gcc-c++ gdb valgrind \
	nodejs npm

# RICE
dnf --setopt=install_weak_deps=False --best install -y \
	breeze-cursor-theme \
	lxappearance \
	materia-gtk-theme \
	papirus-icon-theme

# MISC
# HOSTNAME
hostnamectl set-hostname thinkpad

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# DONE
reboot
