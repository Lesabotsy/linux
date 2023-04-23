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

# Plasma
dnf --setopt=install_weak_deps=False --best install -y \
   plasma-desktop
   plasma-workspace
   plasma-workspace-wallpapers
   qt5-qtbase-gui
   sddm
   sddm-breeze
   sddm-kcm
   NetworkManager-config-connectivity-fedora
   PackageKit-command-not-found
   abrt-desktop
   adwaita-gtk2-theme
   akregator
   bluedevil
   breeze-icon-theme
   colord-kde
   cups-pk-helper
   dnfdragora
   dolphin
   ffmpegthumbs
   firewall-config
   flatpak-kcm
   fprintd-pam
   glibc-all-langpacks
   gnome-keyring-pam
   gwenview
   initial-setup-gui
   kaddressbook
   kamera
   kcalc
   kcharselect
   kde-connect
   kde-gtk-config
   kde-partitionmanager
   kde-print-manager
   kde-settings-pulseaudio
   kdegraphics-thumbnailers
   kdeplasma-addons
   kdialog
   kdnssd
   keditbookmarks
   kf5-akonadi-server
   kf5-akonadi-server-mysql
   kf5-baloo-file
   kf5-kipi-plugins
   kfind
   kgpg
   khelpcenter
   khotkeys
   kinfocenter
   kio-admin
   kio-gdrive
   kmag
   kmail
   kmenuedit
   kmousetool
   kmouth
   konsole5
   kontact
   korganizer
   kscreen
   kscreenlocker
   ksshaskpass
   kwalletmanager5
   kwebkitpart
   kwin
   kwrite
   libappindicator-gtk3
   okular
   pam-kwallet
   phonon-qt5-backend-gstreamer
   pinentry-qt
   plasma-breeze
   plasma-desktop-doc
   plasma-discover
   plasma-discover-notifier
   plasma-disks
   plasma-drkonqi
   plasma-nm
   plasma-nm-l2tp
   plasma-nm-openconnect
   plasma-nm-openswan
   plasma-nm-openvpn
   plasma-nm-pptp
   plasma-nm-vpnc
   plasma-pa
   plasma-systemmonitor
   plasma-thunderbolt
   plasma-vault
   plasma-welcome
   plasma-workspace-geolocation
   plasma-workspace-x11
   polkit-kde
   qt5-qtdeclarative
   spectacle
   systemd-oomd-defaults
   udisks2
   xorg-x11-drv-libinput

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
	mupdf \
	nautilus \
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
