{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    efiSupport = true;
    enableCryptodisk = true;
    gfxmodeEfi = "1024x768";
  };
}
