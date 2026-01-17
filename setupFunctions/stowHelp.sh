source "setupFunctions/notifier.sh"

stowHelp() {
    notify "36" "Stowing '$1' to '$2'"
    pushd $1
    stow * -R -t $2 --adopt
    popd
}
