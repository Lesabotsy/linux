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
 	neovim \
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

# VSCODE
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
dnf install -y code

# LANGUAGES
dnf --setopt=install_weak_deps=False --best install -y \
	python3-pip black \
	java-17-openjdk-devel \
	gcc gcc-c++ gdb valgrind \
	nodejs npm

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
