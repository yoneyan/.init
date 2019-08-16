#!/bin/bash
echo -n User Name?:
read USER

yes | sudo apt update
yes | sudo apt upgrade

#Japanese -> English
LANG=C xdg-user-dirs-gtk-update

#Windows & Linux DualBoot
sudo timedatectl set-local-rtc true

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

##Docker install
yes | sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
yes | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
yes | sudo apt-key fingerprint 0EBFCD88
sudo su -c 'echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" >> /etc/apt/sources.list.d/docker.list'
yes | sudo apt-get update
yes | sudo apt install docker-ce docker-ce-cli containerd.io
yes | sudo gpasswd -a $USER docker
yes | sudo chmod 666 /var/run/docker.sock


##Docker-compose install
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose



##Neovim install
yes | sudo apt install software-properties-common
yes | sudo apt install python-software-properties

yes | sudo add-apt-repository -y ppa:neovim-ppa/stable
yes | sudo apt update
yes | sudo apt install neovim

yes | sudo apt install python-dev python-pip python3-dev python3-pip
