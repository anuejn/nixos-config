{ config, pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>
      ../home/users/anuejn.nix
      ../home/users/root.nix
    ];

  time.timeZone = "Europe/Amsterdam";

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    htop
    killall
  ];
  programs.zsh.enable = true;

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  services.openssh.enable = true;
  services.openssh.passwordAuthentication = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}

