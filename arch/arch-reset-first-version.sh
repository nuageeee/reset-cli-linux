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
        -p | --ping)
          echo "Do you want to test the github or the server? (default server) : "
          read -r plateform
          plateform=${plateform:-server}
          echo "testing $plateform"
          if [[ $plateform == github ]]; then
            status_code=$(curl --write-out "%{http_code}" --silent --output /tmp/response.txt https://github.com/nuageeee/reset-cli-linux)
            if [[ $status_code == 200 ]]; then
              echo "Github repo is available"
            else
             echo "Github repo is not available. Check /tmp/response.txt for more information."
            fi
          else
            ping reset-cli.nuagee.tech
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
  dir_backup=(
    /home/backup
  )
  mkdir "$dir_backup"
  for file in "${save_files[@]}"; do
    echo $file
    cp "$file" "$dir_backup/$file"
  done
}

if [[ -z $save_files ]]; then
  printf "Your system is currently in reset.\n if some errors appears, there is no go-back."
  # shellcheck disable=SC2114
  rm -rf /etc
  sleep 1
  mkdir /etc
  sleep 1
  cp -r /home/etc/* /etc/ 
else
  echo "There is file to save"
  echo "Backup in progress"
  backup_files
  sleep 5
  echo "Reseting system"
fi