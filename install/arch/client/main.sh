#!/bin/bash

yes | sudo pacman --needed -S libmpdclient \
			      alacritty

yay --needed -S hyper \
	        powerline-go
