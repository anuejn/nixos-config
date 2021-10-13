{ config, pkgs, ... }:
{
  imports = [
    <home-manager/nixos>
  ];
  users.users.anuejn = {
    isNormalUser = true;
    home = "/home/anuejn";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  home-manager.users.anuejn = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      jetbrains.idea-ultimate
      jetbrains.webstorm
      jetbrains.pycharm-professional
      vscode
      
      quasselClient
      fractal
      tdesktop

      inkscape
      darktable
      gimp

      libreoffice

      kicad

      pandoc
      gnumake
      htop
      cloc
      nodejs
      python3
      cargo
      gh
      rnix-lsp
      nixpkgs-fmt
      borgbackup
      youtube-dl
      pre-commit
      nodePackages.gitmoji-cli
      nodePackages.web-ext
      patchelf
      hydra-check
      rink
      xclip
    ];

    systemd.user.sessionVariables = {
      EDITOR = "vim";
      MOZ_USE_XINPUT2 = "1";
    };

    programs = {
      firefox = {
        enable = true;
        profiles = {
          default = {
            settings = {
              "browser.startup.homepage" = "about:blank";
            };
            userChrome = ''
              #main-window #TabsToolbar {
                  visibility: collapse !important;
              }
              #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar .titlebar-spacer {
                      border-inline-end: none;
              }
              #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
                display: none;
              }
            '';
          };
        };
        enableGnomeExtensions = true;
      };

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
