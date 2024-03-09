#!/bin/bash
check_arguments() {
    #check if command line arguments are supplied
    while [[ $# -gt 0 ]]; do
        #test for the optional and compulsory argumment cases
        case "$1" in
        -d)
            #list all files and directories if -d is supplied
            all_files=true
            #reset $1 argument and proceed
            shift
            ;;
        #check for -n flag and if an integer follows it
        -n)
            if [[ $2 =~ ^[0-9]+$ ]]; then

                entries=$2
            else
                echo -e "${yel}Warning!!: ${cls}enter the number of directories to display"
                exit 1
            fi
            #reset $1 and $2 arguments and proceed
            shift 2
            ;;
        *)

            directory=$1
            shift
            ;;
        esac

    done

}

#check if directory is supplied and if it exists
check_directory() {
    #if directory path is not supplied
    if [[ -z $directory ]]; then

        echo -e "${red}error!: ${cls}provide directory path to check."
        #exit with error code 1
        exit 1
    fi

    #if suplied directory path does not exist
    if [[ ! -d $directory ]]; then

        echo -e "${red}error!: ${cls}directory $directory does not exist"
        #exit with error code 1
        exit 1
    fi
}

display_diskusage() {
    #if -d argument is supplied
    if [[ $all_files = true ]]; then

        echo -e " ${grn}displaying the top $entries directories and files"${cls}
        sudo du -h "$directory"/* | sort -rh | head -$entries
    else
        echo -e " ${grn}displaying the top $entries directories"${cls}
        sudo du -h --max-depth=1 "$directory" | sort -rh | head -$entries

    fi

}



main() {
    #colour variables
    red='\033[0;31m'
    cls='\033[0m'
    yel='\033[1;33m'
    grn='\033[0;32m'

    #default variables
    all_files=false
    entries=8

    check_arguments "$@"
    check_directory
    display_diskusage
}
#run main function with the command line arguments supplied
main "$@"
