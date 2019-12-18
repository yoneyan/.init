#!/bin/bash

yes | sudo pacman --needed -S zsh

mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin

rm ~/.zshrc
cp ~/.init/config/.zshrc ~/.zshrc
