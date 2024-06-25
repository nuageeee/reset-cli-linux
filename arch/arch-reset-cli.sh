#!/bin/bash
#create by nuage with love and passion

if [ "$(id -u)" != "0" ]; then
    echo "This script need to be run as ROOT user."
    exit 1
fi


if command -v pacstrap > /dev/null; then
    echo "The pacstrap command was not found. Did you want to install it?"
    read -r response
    if [[ $response == yes ]]; then
      yes | pacman -S arch-install-scripts
      echo "The pacstrap command was installated. re-enter your command."
    fi
    exit 1
fi       

# Define variable

options_help="
-h, --help : Provide help panel.
-s, --save : Save file that you provide.
"

while [[ $# -gt 0 ]]; do
    option="$1"
    shift
    save_files=()
    case $option in
        -h | --help)
          echo "$options_help"
          exit 1
          ;;
        -s | --save)
          while true; do
            if [[ $# -ge 1 ]]; then
                save_files+=("$1")
                shift
            else
                break
            fi
          done
          shift
          ;;
        *)
          echo "You provide a non valide option : $option"
          echo "Here is the list of available options : $options_help"
          exit 1
          ;;
    esac
done