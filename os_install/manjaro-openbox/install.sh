#!/bin/bash

yes | sudo pacman --needed -Syuu
yes | sudo pacman --needed -S yay
yes | sudo pacman --needed -S fcitx \
	                          fcitx-{gtk2,gtk3,qt5,mozc,configtool} \
                              adobe-source-han-sans-otc-fonts \
                              remmina \
                              freerdp \
                              libvncserver \
                              neovim \
                              zsh \
                              tmux \
                              veracrypt \
                              qemu \
                              libvirt \
                              qemu-headless \
                              ebtables \
                              dnsmasq \
                              virt-install \
                              nautilus \
                              terminator \
                              polybar \
                              rofi
yes| sudo pacman -S fcitx-im fcitx-configtool fcitx-mozc fcitx-gtk2 fcitx-gtk3 fcitx-qt5 adobe-source-han-sans-jp-fonts

yes | sudo pacman --needed -S python \
	              python-pip \
			      clamav \
			      powertop
yes | yay --needed -S docker \
	              docker-compose \
                  fingerprint-gui \
	              slack-desktop \
       	          inkdrop \
                  networkmanager-l2tp
yay --needed -S google-chrome \
                  jetbrains-toolbox
