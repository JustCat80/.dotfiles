notify() {
    color=$1
    body=$2
    summary=$3
    echo -e "\e[$color""m$body\e[0m"
    notify-send --app-name="Cat's Setup Script" "$summary" "$body"
}