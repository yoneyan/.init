#!/bin/bash

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
systemctl enable tlp-sleep

sudo mv ~/.config/jgmenu ~/.config/jgmenu.bak

sudo cp ~/.init/config/logind.conf /etc/systemd/logind.conf

mv ~/.config/xfce4 ~/.config/xfce4.bak
cp -r ~/.init/config/xfce4 ~/.config
cp -r ~/.init/config/openbox ~/.config
cp -r ~/.init/config/alacritty ~/.config
cp -r ~/.init/config/.netrc ~/.netrc
cp -r ~/.init/config/.xprofile ~/.xprofile
