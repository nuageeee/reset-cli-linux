#create by nuage with love

if [ "$(id -u)" != "0" ]; then
    echo "This script need to be run as ROOT user."
    exit 1
fi

# Define variable

options_help="
-h, --help : Provide help panel.
-y : Accept all the risk that include of reseting linux.
-v : Show debug informations.
-s : Save file that you provide.
"

while [[ $# > 0 ]]; do
    option="$1"
    shift

    case $option in
        -h | --help)
          echo "$options_help"
          ;;
        -v)
          debug=1
          ;;
        -s)
          save_files=$1
          shift
          ;;
        *)
          echo "You provide a non valide option : $option"
          echo "Here is the list of available options : $options_help"
          exit 1
          ;;
    esac
done

base_file=(
    /etc/shadow
    /etc/passwd
)

backup_files() {
    mkdir -p "/home/backup/"
    for file in "$save_files"; do
        cp "$file" "/home/backup/${file}"
    done
    for file in "${base_file[@]}"; do
        # Trouve tous les fichiers qui correspondent au chemin
        files=$(find "$file" -type f)

        # Copier les fichiers trouvés
        for f in "${files[@]}"; do
            cp "$f" "/home/backup/${f}.backup"
        done
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