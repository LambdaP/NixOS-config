{ stdenv, writeText }:

let
    rcfile = builtins.readFile ./vimrc/rc.vim;
in

''
    ${rcfile}
''
