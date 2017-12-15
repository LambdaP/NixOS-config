{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {
  # Here add custom build packages
}
