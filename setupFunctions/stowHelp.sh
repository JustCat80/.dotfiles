source "setupFunctions/notifier.sh"

stowHelp() {
    notify "36" "Stowing '$1' to '$2'"
    pushd $1
    sudo stow * -R -t $2 --adopt
    popd
}
