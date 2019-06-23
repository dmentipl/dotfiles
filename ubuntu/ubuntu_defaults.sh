#!/usr/bin/env bash
#
# Setup Ubuntu defaults.

# Only run in Linux.
[[ $OSTYPE =~ ^linux ]] || return 1

# Ask for the administrator password upfront
sudo -v

# Make sure that Dropbox starts on reboot.
(crontab -l ; echo "@reboot ~/.dropbox-dist/dropboxd")| crontab -

# Caps Lock key and Left Alt key.
gsettings set org.gnome.desktop.input-sources xkb-options "['altwin:swap_lalt_lwin', 'caps:ctrl_modifier']"

# Dock applications.
gsettings set org.gnome.shell favorite-apps ['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', 'steam.desktop', 'org.gnome.tweaks.desktop', 'gnome-control-center.desktop', 'gnome-system-monitor_gnome-system-monitor.desktop']

# Icon theme.
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'

# Desktop background (wallpaper).
cd ~/Pictures || return
wget https://upload.wikimedia.org/wikipedia/commons/9/9e/Milky_Way_IR_Spitzer.jpg
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/Pictures/Milky_Way_IR_Spitzer.jpg"

# Nvidia drivers.
sudo ubuntu-drivers autoinstall
