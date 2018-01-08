{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "fr,us";
    
    xkbOptions = "grp:ctrl_alt_toggle";

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
