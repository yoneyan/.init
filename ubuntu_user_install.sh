#!/bin/bash

pip3 install setuptools
pip3 install neovim

#NVIM Setting Init
mkdir ~/.config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Config File Copy
yes | cp .tmux.conf ~/.tmux.conf
yes | cp .zshrc ~/.zshrc
yes | cp init.vim ~/.config/nvim/init.vim

#Bash -> Zsh
chsh -s $(which zsh)

