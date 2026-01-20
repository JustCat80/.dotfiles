function gpp --wraps='g++ *.cpp -Wall && ./a.out' --description 'alias gpp=g++ *.cpp -Wall && ./a.out'
    g++ *.cpp -Wall && ./a.out $argv
end
