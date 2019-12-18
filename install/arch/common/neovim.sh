#!/bin/bash

yes | sudo pacman --needed -S neovim \
                              python3 \
			      python-pip

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install setuptools
pip3 install neovim
pip3 install --user pynvim

mkdir ~/.config/nvim
cp ~/.init/config/init.vim ~/.config/nvim/init.vim
