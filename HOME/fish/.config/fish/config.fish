source ~/.env.sh
# Commands to run in interactive sessions go here
if status is-interactive
    sleep 0.01s
    fastfetch
end
zoxide init fish --no-cmd | source
