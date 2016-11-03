#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

icon_off="⚋ "
icon_1="⚊ "
icon_2="⚍ "
icon_3="⚌ "
icon_4="☱ "
icon_5="☰ "

print_icon() {
  local strength=$(airport_status | grep -e "CtlRSSI" | awk -F '-' '{print $2}')
	if [[ -z "$strength" ]]; then
		printf "$icon_off"
	elif [[ $strength < 50 ]]; then
		printf "$icon_5"
	elif [[ $strength < 60 ]]; then
		printf "$icon_4"
	elif [[ $strength < 70 ]]; then
		printf "$icon_3"
	elif [[ $strength < 80 ]]; then
		printf "$icon_2"
	elif [[ $strength < 90 ]]; then
		printf "$icon_1"
	fi
}

main() {
	print_icon
}

main
