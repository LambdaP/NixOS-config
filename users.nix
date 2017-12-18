{ pkgs, lib, ... }:

{
  imports = [
    ./users/p.nix
  ];

  programs.zsh.enable               = true;
  users.defaultUserShell            = pkgs.zsh;
  security.sudo.wheelNeedsPassword  = false;

  environment.sessionVariables = {
    EDITOR = "nvim";
  };
}
