{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix

      ../../modules/common.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "niemode";

  services.sshd.enable = true;

  networking.useDHCP = false;
  networking.interfaces.ens3.useDHCP = true;
}
