#!/bin/bash

yes | sudo pacman --needed -S remmina \
                              freerdp \
			      libvncserver
