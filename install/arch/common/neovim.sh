#!/bin/bash

yes | sudo pacman --needed -S neovim \
                              python3 \
			      python-pip

pip3 install setuptools
pip3 install neovim
pip3 install --user pynvim

