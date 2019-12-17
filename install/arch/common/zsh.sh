#!/bin/bash

yes | sudo pacman --needed -S zsh

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh


