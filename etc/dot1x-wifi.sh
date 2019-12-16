#!/bin/bash

echo wifi interface name:
read wifi_interface
echo wifi ssid name:
read wifi_ssid
echo user:
read user
echo password:
read password

sudo nmcli con add type wifi ifname $wifi_interface con-name $wifi_ssid ssid $wifi_ssid
(
echo set ipv4.method auto
echo set 802-1x.eap peap
echo set 802-1x.phase2-auth mschapv2
echo set 802-1x.identity $user
echo set 802-1x.password $password
echo set wifi-sec.key-mgmt wpa-eap
echo save
echo activate
) | sudo nmcli con edit id $wifi_ssid 
