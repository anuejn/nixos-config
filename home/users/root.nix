{ pkgs, config, ... }:
{
  imports = [ <home-manager/nixos> ];

  users.users.root = {
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOqZBLoFmFBTAToQBVdoDcBaeSshJf+S0pl1yR+QeUaA nein@mae"
    ];
  };

  # following is a home-manager module
  home-manager.users.root = { pkgs, lib, ... }: {
    imports = [ ../terminal.nix ];
  };
}
