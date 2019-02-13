#!/usr/bin/env bash
macos_airport_status() {
  /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I
}
get_wifi_strength() {
  macos_airport_status | grep -e "CtlRSSI" | awk -F '-' '{print $2}'
}
get_wifi_ssid() {
  macos_airport_status | grep -e '\bSSID:\B' | awk '{for(i=n;i<=NF;i++)$(i-(n-1))=$i;NF=NF-(n-1);print $0}' n=2
}


