source "setupFunctions/notifier.sh"

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