#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/source_module.sh"

wifi_strength="#($CURRENT_DIR/scripts/wifi_strength.sh)"
wifi_icon="#($CURRENT_DIR/scripts/wifi_icon.sh)"
wifi_ssid="#($CURRENT_DIR/scripts/wifi_ssid.sh)"
wifi_strength_interpolation="\#{wifi_strength}"
wifi_icon_interpolation="\#{wifi_icon}"
wifi_ssid_interpolation="\#{wifi_ssid}"

set_tmux_option() {
  local option="$1"
  local value="$2"
  tmux set-option -gq "$option" "$value"
}

get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value="$(tmux show-option -gqv "$option")"
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

do_interpolation() {
  local string="$1"
  local percentage_interpolated="${string/$wifi_strength_interpolation/$wifi_strength}"
  local remain_interpolated="${percentage_interpolated/$wifi_icon_interpolation/$wifi_icon}"
  local all_interpolated="${remain_interpolated/$wifi_ssid_interpolation/$wifi_ssid}"
  echo "$all_interpolated"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}
main
