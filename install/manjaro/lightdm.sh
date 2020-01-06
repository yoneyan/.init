#!/bin/bash

yes | sudo pacman --needed -S lightdm
yay --needed -S lightdm-webkit2-greeter \
                lightdm-gtk-greeter

sudo systemctl enable lightdm

git clone https://github.com/lveteau/lightdm-webkit-modern-arch-theme ~/git/lightdm-webkit-modern-arch-theme

sudo cp ~/.init/config/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
sudo cp ~/.init/config/lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/lightdm-webkit2-greeter.conf


