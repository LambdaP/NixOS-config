{ pkgs }:

let
  # this is the vimrc.nix from above
  vimrc   = pkgs.callPackage ./vimrc.nix {};

  # and the plugins.nix from above
  plugins = pkgs.callPackage ./plugins.nix {};
in
{
  customRC = vimrc;
  vam = {
    knownPlugins = pkgs.vimPlugins // plugins;

    pluginDictionaries = [
      # from pkgs.vimPlugins
      { name = "colors-solarized"; }
      { name = "neomake"; }
      { name = "deoplete-nvim"; }
      { name = "airline"; }
      { name = "tagbar"; }
      { name = "nerdtree"; }
      { name = "nerdtree-git-plugin"; }

      # Haskell
      { name = "hoogle"; }

      # from our own plugin package set
      # { name = "vim-trailing-whitespace"; }
    ];
  };
}
