#!/bin/sh

wpa_passphrase "$1" "$2" > /etc/wpa_supplicant.conf
wpa_supplicant -B -D nl80211 -i wlan0 -c /etc/wpa_supplicant.conf
dhcpcd -iwlan0
