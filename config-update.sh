#!/bin/bash

##copy Config
cp ~/.init/config/.xprofile ~/.xprofile
cp -r ~/.init/config/.zshrc ~/.zshrc
mkdir ~/.config/nvim
cp -r ~/.init/config/init.vim ~/.config/nvim/init.vim

