{ stdenv, writeText }:

let
    rcfile        = builtins.readFile ./vimrc/rc.vim;
    pluginoptions = builtins.readFile ./vimrc/plugins.vim;
in

''
    ${rcfile}
    ${pluginoptions}
''
