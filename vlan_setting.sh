#!/bin/bash

char="8021q"
result=$(cat /etc/modules |grep 8021q)

if [ $char = $result ]; then
    echo "Found!"
else
    echo "Not Found"
    # enable 8021q
    sudo su -c 'echo "8021q" >> /etc/modules'
fi

## input ##
# input nic device
echo -n NIC-Interface:
read nic
# input vlan
echo -n vlan:
read vlan
# input ip address
echo -n ip address:
read ipaddress
# input netmask
echo -n netmask:
read netmask

str1="auto ${nic}.${vlan}"
str2="iface ${nic}.${vlan} inet static"
str3="    address ${ipaddress}"
str4="    netmask $netmask"
str5="    vlan-raw-device ${nic}"


echo "" >> /etc/network/interfaces
echo "$str1" >> /etc/network/interfaces
echo "$str2" >> /etc/network/interfaces
echo "$str3" >> /etc/network/interfaces
echo "$str4" >> /etc/network/interfaces
echo "$str5" >> /etc/network/interfaces

echo "Finish!!"
