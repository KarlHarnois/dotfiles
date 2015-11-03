#!/usr/bin/env bash

source '../utils.sh'

main() {
  if ! cmd_exists 'brew'; then
    printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
    #  └─ simulate the ENTER keypress
  fi

  print_result $? 'Homebrew'
}

main
