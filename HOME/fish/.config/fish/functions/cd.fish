function cd --wraps=__zoxide_z --description 'zoxide cd plus ls (no hidden files)'
    __zoxide_z $argv
    l
end
