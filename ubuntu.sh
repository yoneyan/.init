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
sudo npm install -g @angular/cli
#Disk Took
sudo apt-get -y install baobab
#Tool
yes | sudo apt install git zsh tmux thunderbird vlc filezilla gnome-calendar 
yes | sudo apt install python3-pip
yes | sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret remmina-plugin-spice remmina-plugin-vnc remmina-plugin-xdmcp remmina-plugin-nx remmina-plugin-exec
yes | sudo apt install guake
yes | snap install discord
yes | snap install ao
##Chrome Install
curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
yes | sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
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

yes | sudo apt install python-dev python-pip python3-dev python3-pip

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


##copy Config
cp -r ~/.init/config/.netrc ~/.netrc
cp ~/.init/config/.xprofile ~/.xprofile
cp -r ~/.init/config/.zshrc ~/.zshrc
mkdir ~/.config/nvim
cp -r ~/.init/config/init.vim ~/.config/nvim/init.vim
