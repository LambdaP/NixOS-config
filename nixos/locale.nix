{ config, pkgs, ... }:

{
  #  Internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";        # Console font
    consoleKeyMap = "fr";                   # Keyboard layout: fr
    defaultLocale = "en_US.UTF-8";          # Default locale: FR UTF-8
  };

  # Time zone.
  time.timeZone = "Europe/Paris";
}
