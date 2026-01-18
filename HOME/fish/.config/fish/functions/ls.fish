function ls --description 'Customized ls command'
    command ls -C -p -h -F -A --color=auto --group-directories-first $argv
end
