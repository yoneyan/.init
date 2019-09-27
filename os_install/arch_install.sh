#!/bin/bash

yes | sudo pacman --needed -Syuu
yes | sudo pacman --needed -S yay
yes | sudo pacman --needed -S fcitx \
	                      fcitx-{gtk2,gtk3,qt5,mozc,configtool} \
                              adobe-source-han-sans-otc-fonts
yes | sudo pacman --needed -S remmina freerdp libvncserver remmina-plugin-teamviewer neovim zsh tmux veracrypt qemu libvirt qemu-headless ebtables dnsmasq virt-install
yes | sudo pacman --needed -S python python-pip clamav powertop
yes | yay --needed -S docker docker-compose fingerprint-gui
yes | yay --needed -S slack-desktop google-chrome inkdrop

