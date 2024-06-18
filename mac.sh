#!/bin/zsh

ONEPASS_PROGRAM_PATH=/Applications/1Password.app/Contents/MacOS/op-ssh-sign

brew update -y && brew upgrade -y
brew install go npm git curl wget neovim tmux zplug pkg-config python3
sh -c "$(curl -fsSL https://git.io/zinit-install)"

#zsh
sh -c "$(curl -fsSL https://git.io/zinit-install)"

#neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir ~/.config/nvim

# Config
cp -r ~/.init/config/init.vim ~/.config/nvim/init.vim
cp -r ~/.init/config/.netrc ~/.netrc
cp -r ~/.init/config/.zshrc_mac ~/.zshrc
cp config/.gitconfig* ~/

# overwrite gitconfig
sed -i "s|{ONEPASS_PROGRAM_PATH}|${ONEPASS_PROGRAM_PATH}|g" ~/.gitconfig*