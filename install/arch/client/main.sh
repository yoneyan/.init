#!/bin/bash

yes | sudo pacman --needed -S libmpdclient \
			                  alacritty \
                              xf86-video-intel \
                              xorg-xbacklight

yay --needed -S hyper \
      	        powerline-go
