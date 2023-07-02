#!/bin/bash

yes | sudo apt update
yes | sudo apt upgrade

#golang install
yes | sudo apt install golang git zsh tmux python3-pip npm
sudo npm install -g yarn

##tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#zsh
cp ~/.init/config/.zshrc ~/.zshrc
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

##Neovim install
yes | sudo apt install neovim
yes | sudo apt install python-dev python3-dev python3-pip
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

##copy Config
cp config/.gitconfig* ~/
cp -r ~/.init/config/.tmux.conf ~/.tmux.conf
cp -r ~/.init/config/.zshrc ~/.zshrc
mkdir -p ~/.config/nvim
cp -r ~/.init/config/init.vim ~/.config/nvim/init.vim

# mariaDB
yes | sudo apt -y install mariadb-server mariadb-backup

# default shell
chsh -s /bin/zsh
