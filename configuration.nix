# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    efiSupport = true;
    enableCryptodisk = true;
    gfxmodeEfi = "1024x768";
  };

  networking = {
    hostName   = "hermione";                # Define the hostname
    extraHosts = "127.0.0.1 hermione";      # Create a self-resolving hostname
    networkmanager.enable = true;           # Let NetworkManager handle network
  };

  #  Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";        # Console font
    consoleKeyMap = "fr";                   # Keyboard layout: fr
    defaultLocale = "fr_FR.UTF-8";          # Default locale: FR UTF-8
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs;
  let
    nixos-unstable = import <nixos-unstable> {};
  in
  [
    neovim
    wget
    gnumake
    git
    zsh
    rxvt_unicode
    stack
    nixos-unstable.firefox
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
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

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.p = {
    description  = "Patrick Lambein";
    isNormalUser = true;
    extraGroups  = [ "wheel" ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "17.09"; # Did you read the comment?

}
