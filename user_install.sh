#!/bin/bash

pip3 install setuptools
pip3 install neovim

#Zsh Setting
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh\| zsh


#NVIM Setting Init
if [ ! -e ~/.config/nvim ];then
   mkdir ~/.config/nvim
fi
pip3 install --user pynvim
pip3 install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Config File Copy
yes | cp .tmux.conf ~/.tmux.conf
yes | cp .zshrc ~/.zshrc
yes | cp .netrc ~/.netrc
yes | cp init.vim ~/.config/nvim/init.vim

#tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Bash -> Zsh
chsh -s $(which zsh)

