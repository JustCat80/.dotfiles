source "setupFunctions/notifier.sh"

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

paruInstall() {
    if [ ! -d "$HOME/Downloads" ]; then
        notify "31" "'$HOME/Downloads' not found, creating"
        mkdir "$HOME/Downloads"
    fi

    if [ -d "$HOME/Downloads/paru" ]; then
        rm -rf "$HOME/Downloads/paru"
    fi
    pushd "$HOME/Downloads"

    notify "36" "Installing paru"

    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm --needed

    cd ..
    rm -rf paru
    popd
}