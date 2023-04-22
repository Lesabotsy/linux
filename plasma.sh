#!/bin/bash

# RPM FUSION
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
               https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# MAIN
dnf --setopt=install_weak_deps=False --best install -y @"base-x" \
						       @"Common NetworkManager Submodules" \
						       @"Fonts" \
						       @"Hardware Support" \
						       @"Multimedia" \
						       plasma-desktop \
						       plasma-workspace \
						       plasma-workspace-wallpapers \
						       qt5-qtbase-gui \
						       sddm \
						       sddm-breeze \
						       sddm-kcm \
						       NetworkManager-config-connectivity-fedora \
						       PackageKit-command-not-found \
						       abrt-desktop \
						       adwaita-gtk2-theme \
						       akregator \
						       bluedevil \
						       breeze-icon-theme \
						       colord-kde \
						       cups-pk-helper \
						       dolphin \
						       ffmpegthumbs \
						       firewall-config \
						       fprintd-pam \
						       glibc-all-langpacks \
						       gnome-keyring-pam \
						       gwenview \
						       initial-setup-gui \
						       kamera \
						       kcharselect \
						       kde-connect \
						       kde-gtk-config \
						       kde-partitionmanager \
						       kde-print-manager \
						       kde-settings-pulseaudio \
						       kdegraphics-thumbnailers \
						       kdeplasma-addons \
						       kdialog \
						       kdnssd \
						       keditbookmarks \
						       kf5-akonadi-server \
						       kf5-akonadi-server-mysql \
						       kf5-baloo-file \
						       kf5-kipi-plugins \
						       kfind \
						       kgpg \
						       khelpcenter \
						       khotkeys \
						       kinfocenter \
						       kio-admin \
						       kio-gdrive \
						       kitty \
						       kmag \
						       kmenuedit \
						       kmousetool \
						       kmouth \
						       kscreen \
						       kscreenlocker \
						       ksshaskpass \
						       kwalletmanager5 \
						       kwebkitpart \
						       kwin \
						       libappindicator-gtk3 \
						       mupdf \
						       pam-kwallet \
						       phonon-qt5-backend-gstreamer \
						       pinentry-qt \
						       plasma-breeze \
						       plasma-desktop-doc \
						       plasma-discover \
						       plasma-discover-notifier \
						       plasma-disks \
						       plasma-drkonqi \
						       plasma-nm \
						       plasma-nm-l2tp \
						       plasma-nm-openconnect \
						       plasma-nm-openswan \
						       plasma-nm-openvpn \m
						       plasma-nm-pptp \
						       plasma-nm-vpnc \
						       plasma-pa \
						       plasma-systemmonitor \
						       plasma-thunderbolt \
						       plasma-vault \
						       plasma-welcome \
						       plasma-workspace-geolocation \
						       plasma-workspace-x11 \
						       polkit-kde \
						       qt5-qtdeclarative \
						       spectacle \
						       systemd-oomd-defaults \
						       udisks2 \
						       xorg-x11-drv-libinput

dnf --setopt=install_weak_deps=False --best install -y aria2 \
						       bat \
						       curl \
						       exa \
						       fish \
						       fd-find \
						       fzf \
						       mpv \
						       mupdf \
						       neovim \
						       openssl \
						       ripgrep \
                                                       transmission \
                                                       unrar \
						       yt-dlp \
                                                       yt-dlp-fish-completion

# PROGRAMMING SETUP
dnf --setopt=install_weak_deps=False --best install -y python3-pip \
                                                       gcc gcc-c++ gdb valgrind \
                                                       nodejs npm

# CHROME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# HOSTNAME
hostnamectl set-hostname thinkpad

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# CLEANING
dnf remove -y nano vim-minimal

# DONE
systemctl enable sddm
systemctl set-default graphical.target
reboot
