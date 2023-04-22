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
						       bluedevil \
						       breeze-gtk \
						       breeze-icon-theme \
						       cagibi \
						       colord-kde \
						       cups-pk-helper \
						       dolphin \
						       glibc-all-langpacks \
						       gnome-keyring-pam \
						       gwenview \
						       kcm_systemd \
						       kde-gtk-config \
						       kde-partitionmanager \
						       kde-print-manager \
						       kde-settings-pulseaudio \
						       kde-style-breeze \
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
						       kitty \
						       kscreen \
						       kscreenlocker \
						       ksshaskpass \
						       ksysguard \
						       kwalletmanager5 \
						       kwebkitpart \
						       kwin \
						       NetworkManager-config-connectivity-fedora \
						       pam-kwallet \
						       phonon-qt5-backend-gstreamer \
						       pinentry-qt \
						       plasma-breeze \
						       plasma-desktop \
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
						       plasma-user-manager \
						       plasma-workspace \
						       plasma-workspace-geolocation \
						       polkit-kde \
						       powerdevil \
						       qt5-qtbase-gui \
						       qt5-qtdeclarative \
						       sddm \
						       sddm-breeze \
						       sddm-kcm \
						       setroubleshoot \
						       sni-qt \
						       spectacle \
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
