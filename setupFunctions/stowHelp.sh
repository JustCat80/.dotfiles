stowHelp() {
    pushd $1
    stow * -R -t $2 --adopt
    popd
}
