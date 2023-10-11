#!/bin/bash

# RPM Fusion
dnf install -y \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Main
dnf --setopt=install_weak_deps=False --best install -y \
	@"base-x" \
	@"Common NetworkManager Submodules" \
	@"Fonts" \
	@"Hardware Support" \
	@"Multimedia" \
	gnome-shell \
 	# gnome-session-xsession \
	power-profiles-daemon

# Gnome Applications
dnf --setopt=install_weak_deps=False --best install -y \
	eog \
	breeze-cursor-theme papirus-icon-theme \
	gnome-browser-connector gnome-extensions-app gnome-tweaks \
	nautilus gvfs-mtp

# Main Applications
dnf --setopt=install_weak_deps=False --best install -y \
	bat fd-find \
	curl \
	exa \
	fish \
	fzf \
	kitty \
	mpv \
	mupdf \
	openssl \
	shfmt \
	transmission \
	unrar \
	yt-dlp-fish-completion aria2

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# Languages + LSP
dnf --setopt=install_weak_deps=False --best install -y \
	python3-pip \
	java-17-openjdk-devel \
	gcc gcc-c++ gdb valgrind \
	clang clang-tools-extra \
	nodejs npm \
	rust cargo rust-analyzer

dnf --setopt=install_weak_deps=False --best update

npm install -g \
	bash-language-server \
	pyright \
	typescript typescript-language-server \
	vscode-langservers-extracted

# Starship
curl -sS https://starship.rs/install.sh | sh

# Removing some Packages
dnf remove -y vim-minimal

# Reboot
systemctl set-default graphical.target
reboot
