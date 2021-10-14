{ pkgs, config, ... }:
{
  imports = [ <home-manager/nixos> ];

  users.users.root = {
    shell = pkgs.zsh;
  };

  # following is a home-manager module
  home-manager.users.root = { pkgs, lib, ... }: {
    imports = [ ../terminal.nix ];
  };
}
