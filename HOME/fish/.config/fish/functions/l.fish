function l --wraps=ls --description 'alias l=ls -C -p -h --color=auto --group-directories-first'
   command ls -C -p -h --color=auto --group-directories-first $argv
end
