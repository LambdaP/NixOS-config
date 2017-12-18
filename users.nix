{ pkgs, lib, ... }:

{
  imports = [
    ./users/p.nix
  ];
  security.sudo.wheelNeedsPassword  = false;

  environment.sessionVariables = {
    EDITOR = "nvim";
  };
}
