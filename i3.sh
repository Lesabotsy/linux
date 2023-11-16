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
	@base-x \
	@fonts \
	dmenu \
	i3 \
	i3status

dnf --setopt=install_weak_deps=False --best install -y \
	acpi \
	feh \
	NetworkManager \
	NetworkManager-wifi \
	pavucontrol \
	picom \
	pipewire \
	pipewire-pulseaudio \
	power-profiles-daemon \
	redshift \
	rofi \
	xbacklight

dnf --setopt=install_weak_deps=False --best install -y \
	aria2 \
	curl \
	ffmpeg \
        feh \
	fish \
	fzf \
	kitty \
	mpv \
	mupdf \
	openssl \
	ranger \
	transmission \
	unrar \
	xclip

# CHROME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm

# RICE
dnf --setopt=install_weak_deps=False --best install -y \
	arc-theme \
	breeze-cursor-theme \
	lxappearance \
	papirus-icon-theme

# MISC
# xorg.conf
echo "Section \"Device\"
        Identifier  \"Intel Graphics\"
        Driver      \"intel\"
        Option      \"Backlight\" \"intel_backlight\"
EndSection" >>/etc/X11/xorg.conf

# .xinitrc
echo "#!/bin/sh              

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x \"\$f\" ] && . \"\$f\"
  done
  unset f
fi

exec i3" >>/home/ralinoro/.xinitrc

# .bashrc
echo "
if [[ ! \$DISPLAY && \$XDG_VTNR -eq 1 ]]; then
  exec startx
fi" >>/home/ralinoro/.bashrc

# HOSTNAME
hostnamectl set-hostname thinkpad

# STARSHIP
curl -sS https://starship.rs/install.sh | sh

# DONE
reboot
