#!/bin/bash

git clone https://github.com/abrasive/xmm7360.git ~/git/xmm7360

yes | sudo pacman -S --needed linux-latest-acpi_call 
yes | sudo pacman -S --needed libmbim modemmanager  usbutils usb_modeswitch mobile-broadband-provider-info nm-connection-editor modem-manager-gui

sudo systemctl enable ModemManager
