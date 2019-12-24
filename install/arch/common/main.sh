#!/bin/bash

yes | sudo pacman --needed -S yay \
                              networkmanager \
                              network-manager-applet \
                              i3lock
			      

yay --needed -S i3lock-fancy-git


sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
