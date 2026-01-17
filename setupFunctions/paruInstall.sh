aurCheck() {
    # AUR check
    echo -e "\e[36mChecking if the AUR responds before continuing..."
    if [ ! ping -c 1 aur.archlinux.org &> /dev/null ]; then
        echo -e "\e[31mAUR ping failed, try again later or check your internet connection\e[0m"
        exit 1
    else
        echo -e "\e[32mAUR check success!\e[0m"
    fi
}

paruInstall() {
    if [ ! -d "$HOME/Downloads" ]; then
        echo "'$HOME/Downloads' not found, creating"
        mkdir "$HOME/Downloads"
    fi

    if [ -d "$HOME/Downloads/paru" ]; then
        rm -rf "$HOME/Downloads/paru"
    fi
    pushd "$HOME/Downloads"

    echo -e "\e[36mInstalling paru\e[0m"

    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm --needed

    cd ..
    rm -rf paru
    popd
}