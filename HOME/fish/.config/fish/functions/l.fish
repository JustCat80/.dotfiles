function l --wraps=ls --description 'alias l=ls -C -p -h -F --color=auto --group-directories-first'
   command ls -C -p -h -F --color=auto --group-directories-first $argv
end
