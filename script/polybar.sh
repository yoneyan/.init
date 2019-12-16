#!/bin/bash

mkdir ~/tmp
cd ~/tmp
git clone https://github.com/yoneyan/polybar-themes
cp ~/tmp/polybar-themes/polybar-5/fonts/* /usr/share/fonts/noto/
rm -rf ~/.config/polybar
cp -r ~/tmp/polybar-themes/polybar-5 ~/.config/polybar

rm -rf ~/tmp
