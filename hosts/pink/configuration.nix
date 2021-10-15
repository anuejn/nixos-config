{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./interception-tools.nix

      ../../modules/common.nix
      ../../modules/workstation.nix
    ];

  boot.initrd.luks.devices = {
    luksroot = {
      device = "/dev/disk/by-partuuid/d6f267a1-e082-0f45-9396-ba56d9274c32";
      allowDiscards = true;
      preLVM = true;
    };
  };
  # this should give us better performance for disk encryption
  boot.initrd.availableKernelModules = [ "aesni_intel" "cryptd" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;

  networking.hostName = "pink";

  networking.useDHCP = false;
  networking.interfaces.wlp109s0.useDHCP = true;
  networking.firewall.enable = false;
}
