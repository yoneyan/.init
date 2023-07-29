#!/bin/bash
USER=$(whoami)

yes | sudo apt update
yes | sudo apt upgrade

#Windows & Linux DualBoot
sudo timedatectl set-local-rtc true

#Japanese Tool
yes | sudo apt install ibus-mozc
#Programing Tool
yes | sudo apt install npm golang
sudo npm install -g yarn
#Tool
yes | sudo apt install fuse libfuse2 zfsutils-linux curl baobab git zsh tmux thunderbird vlc filezilla gnome-calendar 
yes | sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret remmina-plugin-vnc remmina-plugin-exec
yes | sudo apt install guake
yes | sudo apt install powertop tlp tlp-rdw

##Docker install
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo gpasswd -a $USER docker
sudo chmod 666 /var/run/docker.sock

##tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#zsh
cp ~/.init/config/.zshrc ~/.zshrc
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

go get github.com/justjanne/powerline-go

##Neovim install
yes | sudo apt install neovim

yes | sudo apt install python3-dev python3-pip

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

# make folder(git)
mkdir ~/github
mkdir ~/homenoc
mkdir ~/firstloop

# tlp
sudo tlp start

# bash=>zsh
chsh -s /bin/zsh

# veracrypt
sudo apt install veracrypt

# vscode
yes | sudo apt install software-properties-common apt-transport-https wget
cd /tmp
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
yes | sudo apt update
yes | sudo apt install code

# Docker buildx
docker run --privileged --rm tonistiigi/binfmt --install all

# mariaDB
yes | sudo apt -y install mariadb-server mariadb-backup

# VPN
yes | sudo apt -y install network-manager-l2tp-gnome network-manager-openconnect-gnome network-manager-openvpn-gnome network-manager-pptp-gnome network-manager-ssh-gnome network-manager-strongswan network-manager-fortisslvpn-gnome

# KVM
yes | sudo apt install -y qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager

# inotify
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Finish
yes | sudo apt-get autoremove
