#!/bin/bash
#create by nuage with love

if [ "$(id -u)" != "0" ]; then
    echo "This script need to be run as ROOT user."
    exit 1
fi

# Define variable

options_help="
-h, --help : Provide help panel.
-p, --ping : try server/github connection before doing the reset
-s : Save file that you provide.
"

while [[ $# -gt 0 ]]; do
    option="$1"
    shift

    case $option in
        -h | --help)
          echo "$options_help"
          exit 1
          ;;
        -s)
          save_files=$1
          shift
          ;;
        -p | --ping)
          echo "Do you want to test the github or the server? (default server) : "
          read -r plateform
          plateform=${plateform:-server}
          echo "testing $plateform"
          if [ $plateform == github ]; then
            echo "ping github.com"
          else
            ping 87.88.106.74
          fi
          exit 1
          ;;
        *)
          echo "You provide a non valide option : $option"
          echo "Here is the list of available options : $options_help"
          exit 1
          ;;
    esac
done

backup_files() {
    mkdir -p "/home/backup/"
    for file in $save_files; do
        cp "$file" "/home/backup/${file}"
    done
}

if [ -z "$save_files" ]; then
    echo "reset system in progress"
else
    echo "Saving files in progress"
    backup_files
    sleep 5
    echo "Reset system in progress"
fi