{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.p = {
    description  = "Patrick Lambein";
    isNormalUser = true;
    extraGroups  = [ "wheel" ];
  };

  users.users.p.packages = with pkgs;
  let
    nixos-unstable = import <nixos-unstable> {};
  in [
    nixos-unstable.firefox
    zathura                       # PDF viewer
    nixos-unstable.texlive.combined.scheme-full
    stack                         # Haskell project manager
    valgrind                      # Memory analyser
    openvpn
    tor
    tor-browser-bundle-bin
    tmux
    nixos-unstable.alacritty
    ddate
  ] ++ (with haskellPackages; [
    pandoc                        # Text format converter
    hoogle                        # Haskell documentation
  ]);
}
