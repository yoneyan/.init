#!/bin/bash

nmcli c down wwan-mineo

nmcli connection add con-name wwan-mineo type gsm ifname cdc-wdm0 apn mineo-d.jp user mineo@k-opti.com password mineo


nmcli c up wwan-mineo
