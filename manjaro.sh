#!/bin/bash

#locale
sudo localectl set-locale LANG=en_US.UTF-8

#Clock
sudo timedatectl set-local-rtc true

#update
sudo pacman -Syuu

#i3lock download
git clone https://github.com/yoneyan/i3lock-fancy ~/i3lock

#standard install
for f in install/arch/common/*;do
    cmd=`echo sh $f`
    echo -------------install $cmd ------------------
    $cmd
done

for f in install/arch/client/*;do
    cmd=`echo sh $f`
    echo -------------install $cmd ------------------
    $cmd
done

systemctl enable tlp


sudo cp ~/.init/config/logind.conf /etc/systemd/logind.conf

mv ~/.config/xfce4 ~/.config/xfce4.bak
cp -r ~/.init/config/xfce4 ~/.config
cp -r ~/.init/config/openbox ~/.config
cp -r ~/.init/config/alacritty ~/.config
cp -r ~/.init/config/.netrc ~/.netrc
cp ~/.init/config/.xprofile ~/.xprofile
cp ~/.init/config/picom.conf ~/.config/picom.conf
