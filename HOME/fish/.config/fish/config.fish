if status is-interactive
source ~/.env.sh
sleep 0.01s
fastfetch
    # Commands to run in interactive sessions can go here
end
zoxide init fish --no-cmd | source
