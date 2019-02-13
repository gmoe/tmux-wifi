#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MODULES_DIR="$CURRENT_DIR/modules"
case $(uname) in
    "Darwin")
      source "$MODULES_DIR/airport.sh"
      ;;
    "Linux")
      if command -v iw > /dev/null 2>&1; then
        source "$MODULES_DIR/iw.sh"
      fi
      ;;
  esac
