#!/bin/bash

yes | sudo pacman -S --needed fonts \
			      ttf \
                  noto-fonts

yay -S --needed nerd-fonts-iosevka \
                ttf-iosevka 
