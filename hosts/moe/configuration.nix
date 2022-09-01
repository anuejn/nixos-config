{ config, pkgs, lib, ... }:
{
  imports = [
    <home-manager/nix-darwin>
    ../../home/users/anuejn.nix
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/Developer/nix/hosts/moe/configuration.nix
  environment.darwinConfig = "$HOME/Developer/nix/hosts/moe/configuration.nix";
  services.nix-daemon.enable = true;

  programs.zsh.enable = true;  # we do this to be able to use darwin-rebuild in our created env

  homebrew.brewPrefix = "/opt/homebrew/bin/";
}