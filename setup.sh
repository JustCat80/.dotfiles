#!/usr/bin/env bash
source "setupFunctions/stowHelp.sh"
source "setupFunctions/paruInstall.sh"
source "setupFunctions/notifier.sh"
source "setupFunctions/checks.sh"

set -e

sudoCheck

notify "36" "Installing standard packages"
sudo pacman -Syu --noconfirm --needed - < list-pkg.txt

#Set defaults for programs that require them to build
rustup default stable

aurCheck

paruInstall

notify "36" "Installing AUR packages"
paru -Syu --noconfirm --needed --sudoloop - < list-aur.txt

#Stow bs
current_dir=$(pwd)

stowHelp "$current_dir/HOME/" "$HOME"
stowHelp "$current_dir/ROOT/" "/"

notify "36" "Reverting git repo"
git restore .

notify "32" "Success! Exiting Script..."

exit 0

