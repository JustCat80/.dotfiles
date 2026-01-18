source "setupFunctions/notifier.sh"

paruInstall() {
    if pacman -Qi paru > /dev/null; then
	notify "31" "Paru is already installed, Install anyway? (y/N)"
	read -s -n 1 -s -t 3 key || {
	   err=$?
	   if (( $err > 128 )); then
		key=n
	   else
		exit $err
	   fi
	}
	
	case $key in
	    y) 
		notify "36" "y specified, Installing anyway..."
		continue
		;;
	    *) 
		notify "36" "n Specified, skipping paru install..."
		return 0
		;;
	esac	
    fi
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
    makepkg -si --noconfirm

    cd ..
    rm -rf paru
    popd
}
