{ pkgs, config, ... }:
{
  imports = [ <home-manager/nixos> ];

  nix.trustedUsers = [ "anuejn" ];
  users.users.anuejn = {
    isNormalUser = true;
    home = "/home/anuejn";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOqZBLoFmFBTAToQBVdoDcBaeSshJf+S0pl1yR+QeUaA nein@mae"
    ];
  };

  # following is a home-manager module
  home-manager.users.anuejn = { pkgs, lib, ... }: {
    imports = [ ../terminal.nix ]
      ++ (if config.services.xserver.enable then [ ../graphical.nix ] else [ ]);
  };
}
