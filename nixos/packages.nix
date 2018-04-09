{ config, pkgs, ... }:

{
  # Packages installed in system profile
  environment.systemPackages = with pkgs;
  [
    wget
    git

    stow
    coreutils
    gnumake
    manpages
    stdmanpages

    gcc
    arandr

    # Terminal emulation
    alacritty
    tmux
    rxvt_unicode-with-plugins
    urxvt_vtwheel
    urxvt_font_size

    dmenu
    haskellPackages.xmobar    # Status bar for xmonad
    haskellPackages.yeganesh  # dmenu wrapper (requires dmenu)
  ] ++ (let neovimPackages = import ./neovim.nix pkgs;
    in neovimPackages);
}
