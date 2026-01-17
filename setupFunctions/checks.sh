source "setupFunctions/notifier.sh"

sudoCheck() {
    if [ "$EUID" = 0 ]; then
        notify "31" "DO NOT RUN THIS SCRIPT AS SUDO... EXITING"
        exit 1
    fi
}

aurCheck() {
    # AUR check
    notify "36" "Checking if the AUR responds before continuing..."
    if [ ! ping -c 1 aur.archlinux.org &> /dev/null ]; then
        notify "31" "AUR ping failed, try again later or check your internet connection"
        exit 1
    else
        notify "32" "AUR check success!"
    fi
}
