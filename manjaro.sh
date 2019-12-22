#!/bin/bash

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
sudo cp ~/.init/config/tlp /etc/default/tlp

sudo cp ~/.init/script/lte.sh /etc/profile.d/
sudo mv ~/.config/xfce4 ~/.config/xfce4.bak
sudo cp -r ~/.init/config/xfce4 ~/.config
