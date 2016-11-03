#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_wifi_strength() {
  airport_status | grep -e "CtlRSSI" | awk -F '-' '{print -$2 "dB"}'
}

main() {
  local str="$(print_wifi_strength)"
}
main
