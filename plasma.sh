#!/bin/bash

# RPM Fusion
dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Base
dnf --setopt=install_weak_deps=False --best install -y \
	@base-x \
	@Fonts \
	@Multimedia \
	intel-media-driver \
	iwl7260-firmware \
	NetworkManager-bluetooth \
	NetworkManager-wifi

# Desktop Environment
dnf --setopt=install_weak_deps=False --best install -y \
	plasma-desktop \
	plasma-workspace \
	plasma-workspace-wallpapers \
	qt5-qtbase-gui \
	sddm \
	sddm-breeze \
	sddm-kcm

dnf --setopt=install_weak_deps=False --best install -y \
	bluedevil \
	breeze-icon-theme \
	colord-kde \
	cups-pk-helper \
	dolphin \
	glibc-all-langpacks \
	gnome-keyring-pam \
	gwenview \
	kde-gtk-config \
	kde-partitionmanager \
	kde-print-manager \
	kde-settings-pulseaudio \
	kdegraphics-thumbnailers \
	kdeplasma-addons \
	kdialog \
	kdnssd \
	kf5-akonadi-server \
	kf5-akonadi-server-mysql \
	kf5-baloo-file \
	kf5-kipi-plugins \
	khotkeys \
	kmenuedit \
	konsole5 \
	kscreen \
	kscreenlocker \
	ksshaskpass \
	kwalletmanager5 \
	kwebkitpart \
	kwin \
	mpv \
	mupdf \
	NetworkManager-config-connectivity-fedora \
	pam-kwallet \
	phonon-qt5-backend-gstreamer \
	pinentry-qt \
	plasma-breeze \
	plasma-desktop-doc \
	plasma-drkonqi \
	plasma-nm \
	plasma-nm-l2tp \
	plasma-nm-openconnect \
	plasma-nm-openswan \
	plasma-nm-openvpn \
	plasma-nm-pptp \
	plasma-nm-vpnc \
	plasma-pa \
	plasma-thunderbolt \
	plasma-workspace-geolocation \
	plasma-workspace-x11 \
	polkit-kde \
	qt5-qtdeclarative \
	spectacle \
	xorg-x11-drv-libinput

# Applications
dnf --setopt=install_weak_deps=False --best install -y \
	aria2 \
	bat \
	btop \
	curl \
	exa \
	fd-find \
	fish \
	fzf \
	neovim \
	openssl \
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
sudo systemctl enable sddm
sudo systemctl set-default graphical.target
reboot
