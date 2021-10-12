{ config, pkgs, ... }:
{
  imports = [
    <home-manager/nixos>
  ];
  users.users.anuejn = {
    isNormalUser = true;
    home = "/home/anuejn";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.anuejn = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      firefox
      tdesktop
      kicad
      jetbrains.idea-ultimate
      jetbrains.webstorm
      jetbrains.pycharm-professional
      vscode
      libreoffice

      pandoc
      htop
      cloc
      nodejs
      python3
      cargo
      gh
      rnix-lsp
      nixpkgs-fmt
      borgbackup
    ];
    
    programs = {
      git = import ./git.nix;
      exa.enable = true;
      bat.enable = true;
      autojump.enable = false;
      zoxide.enable = true;
      fzf.enable = true;
      jq.enable = true;
      zsh = import ./zsh.nix;

      starship = {
        enable = true;
        enableZshIntegration = true;
      };
    };

    dconf = (import ./dconf.nix) { lib = lib; };
  };
}
