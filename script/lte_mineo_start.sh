#!/bin/bash

nmcli c down wwan-mineo
nmcli c delete wwan-mineo


nmcli connection add con-name wwan-mineo type gsm ifname cdc-wdm0 apn mineo-s.jp user mineo@k-opti.com password mineo


nmcli c up wwan-mineo
