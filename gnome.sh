#!/bin/bash

# RPM Fusion
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
               https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Hardware Support
dnf --setopt=install_weak_deps=False --best install -y intel-gpu-firmware \
						       intel-media-driver \
						       iwl7260-firmware

# Networks
dnf --setopt=install_weak_deps=False --best install -y NetworkManager-bluetooth \
						       NetworkManager-wifi

# Gnome Shell
dnf --setopt=install_weak_deps=False --best install -y @base-x \
						       gnome-shell \
						       gdm \
                                                       power-profiles-daemon
# Applications
dnf --setopt=install_weak_deps=False --best install -y aria2 \
                                                       bat \
						       breeze-cursor-theme \
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
						       gnome-shell-extension-dash-to-dock \
						       gnome-system-monitor \
                                                       kitty \
                                                       nautilus \
                                                       neovim \
						       openssl \
						       python3-streamlink \
						       ripgrep \
						       transmission \
                                                       unrar \
                                                       vlc \
                                                       yt-dlp \
						       yt-dlp-fish-completion
						       
# MTP (Android Phone Dependencies)
dnf --setopt=install_weak_deps=False --best install -y gvfs-mtp \
						       simple-mtpfs

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# Programming Languages
dnf --setopt=install_weak_deps=False --best install -y python3-pip \
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
