source ~/.env.sh
if status is-interactive
sleep 0.01s
fastfetch
    # Commands to run in interactive sessions can go here
end
zoxide init fish --no-cmd | source
