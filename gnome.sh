#!/bin/bash

# RPM Fusion
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
               https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Base
dnf --setopt=install_weak_deps=False --best install -y @base-x \
						       @"Common NetworkManager Submodules" \
						       @"Hardware Support" \
						       @fonts

dnf --setopt=install_weak_deps=False --best install -y gnome-shell \
						       gdm \
                                                       power-profiles-daemon
# Apps
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
                                                       kitty \
                                                       nautilus \
                                                       neovim \
						       openssl \
						       python3-streamlink \
						       ripgrep \
                                                       unrar \
                                                       vlc \
                                                       yt-dlp \
						       yt-dlp-fish-completion

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# Programming languages
dnf --setopt=install_weak_deps=False --best install -y python3-pip \
                                                       java-17-openjdk-devel \
                                                       gcc gcc-c++ gdb valgrind \
                                                       nodejs npm

# adw-gtk3
wget https://github.com/lassekongo83/adw-gtk3/releases/download/v4.4/adw-gtk3v4-4.tar.xz

# Starship
curl -sS https://starship.rs/install.sh | sh

# Removing some packages
dnf remove -y nano vim-minimal

# Reboot
systemctl set-default graphical.target
reboot
