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
	pulseaudio-utils \
	rofi

dnf --setopt=install_weak_deps=False --best install -y \
	bat fd-find \
	curl \
	exa \
	feh \
	ffmpeg \
	fish \
	fzf \
	kitty \
	mpv \
	mupdf \
	openssl \
	ranger \
	shfmt \
	transmission \
	unrar \
	xclip \
	yt-dlp-fish-completion aria2

# CHROME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# LANGUAGES & TOOLS
dnf --setopt=install_weak_deps=False --best install -y \
	python3-pip black \
	java-17-openjdk-devel \
	gcc gcc-c++ gdb valgrind clang-tools-extra \
	nodejs npm

dnf --setopt=install_weak_deps=False --best update
npm install -g npm@10.1.0

npm install -g \
  bash-language-server \
  pyright \
  typescript typescript-language-server \
  vscode-langservers-extracted
  
# RICE
dnf --setopt=install_weak_deps=False --best install -y \
	arc-theme breeze-cursor-theme papirus-icon-theme \
	lxappearance

# HOSTNAME
hostnamectl set-hostname thinkpad

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# DONE
reboot
