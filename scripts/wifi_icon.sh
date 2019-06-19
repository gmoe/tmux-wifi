#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/source_module.sh"

icon_off="⚋ "
icon_1="⚊ "
icon_2="⚍ "
icon_3="⚌ "
icon_4="☱ "
icon_5="☰ "

get_icon() {
    local option="$1"
    local default="$2"

    local value_of_option=$(tmux show-option -gqv "$option")

    if [[ -z "$value_of_option" ]]; then
        echo "$default"
    else
        echo "$value_of_option"
    fi
}

print_icon() {
  local strength=$(get_wifi_strength)

  if [[ -z "$strength" ]]; then
    printf "$(get_icon @tmux_wifi_icon_off $icon_off)"
  elif [[ $strength < 50 ]]; then
    printf "$(get_icon @tmux_wifi_icon_5 $icon_5)"
  elif [[ $strength < 60 ]]; then
    printf "$(get_icon @tmux_wifi_icon_4 $icon_4)"
  elif [[ $strength < 70 ]]; then
    printf "$(get_icon @tmux_wifi_icon_3 $icon_3)"
  elif [[ $strength < 80 ]]; then
    printf "$(get_icon @tmux_wifi_icon_2 $icon_2)"
  elif [[ $strength < 90 ]]; then
    printf "$(get_icon @tmux_wifi_icon_1 $icon_1)"
  fi
}

main() {
  print_icon
}

main
