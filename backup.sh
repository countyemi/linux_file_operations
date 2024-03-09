#!/bin/bash
red='\033[0;31m'
cls='\033[0m'
yel='\033[1;33m'
grn='\033[0;32m'

check_tar() {
    #install tar if not installed
    if ! command -v tar &>/dev/null; then
        echo "tar is not installed. Installing tar..."
        sudo apt-get update
        sudo apt-get install tar
    fi

}

check_arguments() {
    #if input arguments is less than 2
    if [ $# -ne 2 ]; then
        echo -e "${red}error!: ${cls} $0 needs ${yel}<source_directory> ${cls}and ${yel}<destination_directory>"

        exit 1
    fi

}

create_backup() {

    timestamp=$(date '+%Y_%m_%d_%H-%M')
    source_directory=$1
    destination_directory=$2
    backup_directory=$destination_directory$timestamp.tar.gz

    #create tar file of the backup

    if sudo tar -czf "$backup_directory" "$source_directory"; then
        echo -e "${grn}Success!!: ${cls}$backup_directory" created
    else
        echo -e "${red}Error:${cls} try again"
        exit 1
    fi
}

main() {
    check_tar
    check_arguments "$@"
    create_backup "$@"
}

main "$@"
