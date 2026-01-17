#!/bin/bash
source "setupFunctions/stowHelp.sh"
source "setupFunctions/paruInstall.sh"

set -e

echo -e "\e[36mInstalling standard packages\e[0m"
sudo pacman -Syu --noconfirm --needed - < list-pkg.txt

#Set defaults for programs that require them to build
rustup default stable

aurCheck

paruInstall

echo -e "\e[36mInstalling AUR packages\e[0m"
paru -Syu --noconfirm --needed --sudoloop - < list-aur.txt

#Stow bs
current_dir=$(pwd)

echo -e "\e[36mStowing to the home directory\e[0m"
stowHelp "$current_dir/HOME/" "$HOME"

echo -e "\e[36mStowing to the root directory\e[0m"
stowHelp "$current_dir/ROOT/" "/"

echo -e "\e[32mSuccess! Exiting Script...\e[0m"

exit 0

