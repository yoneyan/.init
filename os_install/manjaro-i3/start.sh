#!/bin/bash

xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https

pip3 install setuptools
pip3 install neovim

#Zsh Setting
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

#NVIM Setting Init
if [ ! -e ~/.config/nvim ];then
   mkdir ~/.config/nvim
fi
pip3 install --user pynvim
pip3 install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#Config remove
rm -rf ~/.tmux.conf
rm -rf ~/.zshrc
rm -rf ~/.netrc
rm -rf ~/.config/nvim/init.vim
rm -rf ~/.i3/config

#make directory
mkdir ~/.config/polybar

#Config File Copy
yes | ln -sf ~/.init/base_config/.tmux.conf ~/.tmux.conf
yes | ln -sf ~/.init/base_config/.zshrc ~/.zshrc
yes | cp ~/.init/base_config/.netrc ~/.netrc
yes | ln -sf ~/.init/base_config/init.vim ~/.config/nvim/init.vim
yes | ln -sf ~/.init/manjaro-i3/i3/config ~/.i3/config
yes | ln -sf ~/.init/manjaro-i3/compton/compton.conf ~/.config/compton.conf
yes | ln -sf ~/.init/manjaro-i3/polybar/config ~/.config/polybar/config
yes | cp polybar/launch.sh ~/.config/polybar/launch.sh

#tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Bash -> Zsh
chsh -s $(which zsh)
