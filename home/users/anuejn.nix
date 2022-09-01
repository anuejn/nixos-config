{ pkgs, config, lib, stdenv, ... }:
let
  inherit (pkgs) stdenv;
  inherit (lib) mkIf;
in
{

  users.users.anuejn = if stdenv.isLinux then {
    isNormalUser = true;
    home = "/home/anuejn";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOqZBLoFmFBTAToQBVdoDcBaeSshJf+S0pl1yR+QeUaA nein@mae"
    ];
  } else {
    shell = pkgs.zsh;
    home = "/Users/anuejn";
  };

  # following is a home-manager module
  home-manager.users.anuejn = { pkgs, lib, ... }: {
    imports = [ ../terminal.nix ]
    ++ (if stdenv.isLinux && config.services.xserver.enable then [ ../graphical.nix ] else [ ]);

    home.stateVersion = "21.05";
  };
}
