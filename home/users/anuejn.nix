{ pkgs, config, ... }:
{
  imports = [ <home-manager/nixos> ];

  users.users.anuejn = {
    isNormalUser = true;
    home = "/home/anuejn";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # following is a home-manager module
  home-manager.users.anuejn = { pkgs, lib, ... }: {
    imports = [ ../terminal.nix ]
      ++ (if config.services.xserver.enable then [ ../graphical.nix ] else [ ]);
  };
}
