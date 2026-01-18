function l --description 'The same as the ls function but without showing hidden directories'
    command ls -C -p -h -F --color=auto --group-directories-first $argv
end
