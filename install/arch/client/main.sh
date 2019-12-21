#!/bin/bash

yes | sudo pacman --needed -S libmpdclient \
			                  alacritty \
                              xf86-video-intel

yay --needed -S hyper \
      	        powerline-go
