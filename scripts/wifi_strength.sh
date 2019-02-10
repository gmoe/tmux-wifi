#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

macos_wifi_strength() {
  macos_airport_status | grep -e "CtlRSSI" | awk -F '-' '{print -$2 "dB"}'
}

main() {
  case $(uname) in
    "Darwin")
      macos_wifi_strength
      ;;
    "Linux")
      ;;
  esac
}
main
