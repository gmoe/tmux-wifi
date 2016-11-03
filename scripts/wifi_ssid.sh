#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

wifi_ssid() {
  airport_status | grep -e '\bSSID:\B' | awk '{print $2}'
}

main() {
  wifi_ssid
}
main
