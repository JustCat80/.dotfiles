source "setupFunctions/notifier.sh"

otdSetup() {
    notify "36" "Enabling OpenTabletDriver on boot"
    systemctl --user enable opentabletdriver.service --now
    notify "36" "Updating udev rules for OTD"
    sudo udevadm control --reload-rules && sudo udevadm trigger
}
