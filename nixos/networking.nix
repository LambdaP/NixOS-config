{ config, pkgs, ... }:

{
  networking = {
    hostName   = "hermione";                # Define the hostname
    extraHosts = "127.0.0.1 hermione";      # Create a self-resolving hostname
    networkmanager.enable = true;           # Let NetworkManager handle network
  };
}
