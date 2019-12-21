#!/bin/bash

sudo sh ~/git/xmm7360/xmm2usb

echo 'AT+GTUSBMODE?' | sudo tee /dev/ttyACM0
echo 'AT+GTUSBMODE=7' | sudo tee /dev/ttyACM0
echo 'AT+CFUN=15' | sudo tee /dev/ttyACM0

sudo modprobe usb_wwan
sudo modprobe qmi_wwan
