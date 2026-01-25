function l --description 'The same as the ls function but does not show hidden directories if there are more than 10'
    set -f lsOpts -C -p -h -F --color=auto --group-directories-first
    
    argparse -u 'A/almost-all' -- $argv #removes -A from vars
    
    set -f dir $argv
    if not count $argv > /dev/null
        set -f dir "."
    end
    set -f fileCount $(math $(find $dir -maxdepth 1 | wc -l) -1)
    if test $fileCount -lt 1
        echo -e "\e[31mdirectory empty\e[0m"
    end
    set -f hiddenFileCount $(math $(find $dir -maxdepth 1 -name ".*" | wc -l) -1)
    if set -ql _flag_A
      or test $hiddenFileCount -lt 10
        command ls $lsOpts -A $argv_opts $argv
        return
    else
        echo -e "\e[31m$hiddenFileCount hidden items\e[0m"
        command ls $lsOpts $argv_opts $argv
    end
end
