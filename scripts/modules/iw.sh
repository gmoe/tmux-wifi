#!/usr/bin/env bash
# Note, iw isn't a stable interface so this scraping may not work with all versions
get_wireless_device(){
  iw dev | awk '$1=="Interface"{print $2}'
}
get_wifi_strength() {
  iw dev $(get_wireless_device) link | grep signal | cut -d'-' -f 2 | awk '{print $1}'
}
get_wifi_ssid() {
  if command -v iwgetid > /dev/null 2>&1; then
    iwgetid -r
  else
    iw dev $(get_wireless_device) link | grep 'SSID' | awk '{print $2}'
  fi
}

