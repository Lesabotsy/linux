#!/bin/bash

# RPM Fusion
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
               https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Nvidia Drivers
dnf --setopt=install_weak_deps=False --best install -y akmod-nvidia \
						       xorg-x11-drv-nvidia-cuda

# Gnome Shell
dnf --setopt=install_weak_deps=False --best install -y @base-x \
						       @fonts \
						       gnome-shell \
						       pipewire-pulseaudio \
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
                                                       kitty \
						       mupdf \
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
