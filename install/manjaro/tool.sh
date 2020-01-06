#!/bin/bash

yes | sudo pacman --needed -S gimp \
	                      hugo

yay --needed -S slack-desktop
