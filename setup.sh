#!/bin/bash
set -e

echo -e "\e[36mInstalling standard packages\e[0m"
sudo pacman -Syu --noconfirm --needed - < list-pkg.txt

#Set defaults for programs that require them to build
rustup default stable

# AUR check
echo -e "\e[36mChecking if the AUR responds before continuing..."
if [ ! ping -c 1 aur.archlinux.org &> /dev/null ]; then
    echo -e "\e[31mAUR ping failed, try again later or check your internet connection\e[0m"
    exit 1
else
    echo -e "\e[32mAUR check success!\e[0m"
fi

if [ ! -d "$HOME/Downloads" ]; then
    echo "'$HOME/Downloads' not found, creating"
    mkdir "$HOME/Downloads"
fi

if [ -d "$HOME/Downloads/paru" ]; then
    rm -rf "$HOME/Downloads/paru"
fi
pushd "$HOME/Downloads"

echo -e "\e[36mInstalling paru\e[0m"

#git clone https://aur.archlinux.org/paru.git
#cd paru
#makepkg -si --noconfirm --needed

#cd ..
#rm -rf paru
popd

echo -e "\e[36mInstalling AUR packages\e[0m"
paru -Syu --noconfirm --needed --sudoloop - < list-aur.txt

#Stow bs

echo -e "\e[36mStowing to the home directory\e[0m"
pushd "HOME"

stow * -R -t "$HOME" --adpot
popd

echo -e "\e[36mStowing to the root directory\e[0m"
pushd "ROOT"

stow * -R -t / --adopt
popd

echo -e "\e[32mSuccess! Exiting Script...\e[0m"

exit 0

