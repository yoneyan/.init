#!/bin/bash

git clone https://github.com/yoneyan/polybar-themes ~/git/polybar-themes

cp -r ~/git/polybar-themes/polybar ~/.config/

sudo cp ~/.config/polybar/fonts/* /usr/share/fonts/noto/
