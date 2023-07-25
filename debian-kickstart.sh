#!/bin/bash

apt purge --autoremove -y \
	kate kwrite \
	konqueror \
	nano vim-common vim-tiny

# UPDATES + APPS
apt update && apt upgrade -y
apt install --no-install-recommends -y \
	aria2 \
	bat \
	curl \
	exa \
	fd-find \
	fish \
	ffmpeg \
	fzf \
	gwenview \
	kde-spectacle \
	mpv \
 	mupdf \
	neovim \
	transmission \
	unzip unrar-free \
	yt-dlp \
	zip

# PROGRAMMING LANGUAGES
apt install --no-install-recommends -y \
	gcc gdb g++ valgrind \
	openjdk-17-jdk \
	python3-pip python3-autopep8

curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&
	apt-get install -y nodejs

# CHROME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg --install google-chrome-stable_current_amd64.deb
apt install -f
rm google-chrome-stable_current_amd64.deb

# VSCODE
wget https://az764295.vo.msecnd.net/stable/695af097c7bd098fbf017ce3ac85e09bbc5dda06/code_1.79.2-1686734195_amd64.deb
dpkg --install code_1.79.2-1686734195_amd64.deb
rm code_1.79.2-1686734195_amd64.deb

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# FONTS
cp -r /home/ralinoro/.fonts/fontsTT/* /usr/share/fonts/truetype/
cp -r /home/ralinoro/.fonts/fontsOT/* /usr/share/fonts/opentype/
rm -r /home/ralinoro/.fonts/
