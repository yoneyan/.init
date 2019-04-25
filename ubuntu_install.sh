#!/bin/bash

yes | sudo apt update
yes | sudo apt upgrade


#Tool
yes | sudo apt install git zsh tmux
yes | sudo apt install python3-pip
yes | sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret remmina-plugin-spice remmina-plugin-vnc remmina-plugin-xdmcp remmina-plugin-telepathy remmina-plugin-nx remmina-plugin-exec
yes | sudo apt install guake

##Chrome Install
curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
yes | echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
yes | sudo apt update
yes | sudo apt install google-chrome-stable

##FingerPrint-GUI Install
sudo add-apt-repository ppa:fingerprint/fingerprint-gui
yes | sudo apt update
yes | sudo apt install libbsapi policykit-1-fingerprint-gui fingerprint-gui

##Neovim install
yes | sudo apt install software-properties-common
yes | sudo apt install python-software-properties

yes | sudo add-apt-repository ppa:neovim-ppa/stable
yes | sudo apt update
yes | sudo apt install neovim

yes | sudo apt install python-dev python-pip python3-dev python3-pip

#Zsh Setting
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


#neovim Setting
if [ ! -e ~/.config/nvim ];then
   mkdir ~/.config/nvim
fi
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim

#Config File Copy
yes | cp .tmux.conf ~/.tmux.conf
yes | cp .zshrc ~/.zshrc
yes | cp init.vim ~/.config/nvim/init.vim

#Bash -> Zsh
chsh -s $(which zsh)

#Japanese -> English
LANG=C xdg-user-dirs-gtk-update

