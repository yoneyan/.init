#!/bin/bash
echo -n User Name?:
read USER

yes | sudo apt update
yes | sudo apt upgrade

#Japanese -> English
LANG=C xdg-user-dirs-gtk-update

#Windows & Linux DualBoot
sudo timedatectl set-local-rtc true

#Japanese Tool
yes | sudo apt install fcitx-mozc
#Programing Tool
yes | sudo apt install npm golang
sudo npm install -g yarn
#Disk Took
sudo apt-get -y install baobab
#Tool
yes | sudo apt install git zsh tmux thunderbird vlc filezilla gnome-calendar 
yes | sudo apt install python3-pip
yes | sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret remmina-plugin-spice remmina-plugin-vnc remmina-plugin-xdmcp remmina-plugin-nx remmina-plugin-exec
yes | sudo apt install guake
yes | sudo apt install powertop tlp tlp-rdw
##Chrome Install
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
yes | sudo apt update
yes | sudo apt install google-chrome-stable

##Docker install
yes | sudo apt-get install \
        apt-transport-https \
            ca-certificates \
                curl \
                    gnupg-agent \
                        software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
yes | sudo apt update
yes | sudo apt install docker-ce docker-ce-cli containerd.io
sudo gpasswd -a $USER docker
sudo chmod 666 /var/run/docker.sock

##Docker-compose install
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

##tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#zsh
cp ~/.init/config/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

go get github.com/justjanne/powerline-go

##Neovim install
yes | sudo apt install neovim

yes | sudo apt install python-dev python3-dev python3-pip

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


##copy Config
cp -r ~/.init/config/.netrc ~/.netrc
cp -r ~/.init/config/.tmux.conf ~/.tmux.conf
cp ~/.init/config/.xprofile ~/.xprofile
cp -r ~/.init/config/.zshrc ~/.zshrc
mkdir ~/.config/nvim
cp -r ~/.init/config/init.vim ~/.config/nvim/init.vim
cp config/.gitconfig* ~/

# tlp
sudo tlp start

#
chsh -s /bin/zsh

# Pulse Secure
cd $HOME/Downloads/ && wget http://webdev.web3.technion.ac.il/docs/cis/public/ssl-vpn/ps-pulse-ubuntu-debian.deb

cd $HOME/Downloads
sudo apt install libnss3-tools && sudo dpkg -i ps-pulse-ubuntu-debian.deb

# veracrypt
sudo apt install veracrypt

# vscode
yes | sudo apt install software-properties-common apt-transport-https wget
cd /tmp
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
yes | sudo apt update
yes | sudo apt install code

# mariaDB
yes | sudo apt -y install mariadb-server mariadb-backup

# VPN
yes | sudo apt -y install network-manager-l2tp-gnome network-manager-openconnect-gnome network-manager-openvpn-gnome network-manager-pptp-gnome network-manager-ssh-gnome network-manager-strongswan network-manager-fortisslvpn-gnome

# KVM
yes | sudo apt-get install virt-manager

# inotify
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
