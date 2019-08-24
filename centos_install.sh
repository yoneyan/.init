#!/bin/bash
echo -n User Name?:
read USER

yes | sudo yum -y epel-release
yes | sudo yum -y update

#Windows & Linux DualBoot
sudo timedatectl set-local-rtc true

#Tool
yes | sudo yum install git zsh tmux
yes | sudo yum install python3-pip

##Docker install
yes | sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
yes | sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yes | sudo yum -y update
yes | sudo yum -y install docker-ce docker-ce-cli containerd.io
sudo gpasswd -a $USER docker
sudo chmod 666 /var/run/docker.sock
sudo systemctl start docker
sudo systemctl enable docker

##Docker-compose install
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose



##Neovim install
yes | yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yes | sudo yum -y update
yes | sudo yum -y install neovim

yes | sudo yum -y install python-dev python-pip python3-dev python3-pip
