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
  users.motd = ''
          _                            _      _ 
    _ __ (_) ___   _ __ ___   ___   __| | ___| |
    | '_ \| |/ _ \ | '_ ` _ \ / _ \ / _` |/ _ \ |
    | | | | |  __/ | | | | | | (_) | (_| |  __/_|
    |_| |_|_|\___| |_| |_| |_|\___/ \__,_|\___(_)
                                                  
  '';

  networking.firewall.allowedTCPPorts = [ 22 80 443 ];

  security.sudo.wheelNeedsPassword = false;

  networking.useDHCP = false;
  networking.interfaces.ens3.useDHCP = true;
}
