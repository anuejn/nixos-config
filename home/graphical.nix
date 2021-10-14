{ pkgs, lib, ... }: {
  imports = [ ./dconf.nix ];

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

    gnomeExtensions.night-theme-switcher
    gnomeExtensions.gtk-title-bar
  ];

  # some more or less advanced firefox configuration
  systemd.user.sessionVariables = {
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
  };
}
