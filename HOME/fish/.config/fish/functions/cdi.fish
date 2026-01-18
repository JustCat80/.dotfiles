function cdi --wraps=__zoxide_zi --description 'zoxide cdi plus ls (no hidden files)'
    __zoxide_zi $argv
    l
end
