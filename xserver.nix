{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "fr";

    windowManager = {
      default                       = "xmonad";
      xmonad.enable                 = true;
      xmonad.enableContribAndExtras = true;
    };

    desktopManager = {
      default      = "none";
      xterm.enable = false;
    };

    libinput.enable = true;
  };
}
