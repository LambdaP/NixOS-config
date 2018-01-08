{ config, lib, pkgs, ... }:

{
  boot.initrd.luks.devices."crypt_root" = {
    device        = "/dev/disk/by-uuid/2f0021b9-7a1d-4ded-b5ff-2215c5890aaf";
    preLVM        = true;
    allowDiscards = true;
  };

  fileSystems."/" = {
    options = [ "noatime" "nodiratime" "discard" ];
  };

  fileSystems."/home" = {
    options = [ "noatime" "nodiratime" "discard" ];
  };
}
