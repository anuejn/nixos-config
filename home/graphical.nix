{ pkgs, lib, ... }: {
  imports = [ ./dconf.nix ];

  home.packages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.pycharm-professional
    vscode

    chromium
    mpv
    cozy
    gnome.gnome-books
    calibre

    quasselClient
    fractal
    tdesktop
    mumble
    element-desktop
    discord
    pika-backup

    inkscape
    python39Packages.urllib3  # this is an incscape-dep
    python39Packages.pygobject3  # this is an incscape-plugin-dep

    darktable
    gimp
    xournalpp
    mypaint

    libreoffice
    fontforge-gtk

    # kicad
    freecad

    blender

    gnomeExtensions.night-theme-switcher
    gnomeExtensions.gtk-title-bar
    # gnomeExtensions.wintile-windows-10-window-tiling-for-gnome

    filezilla

    carla
    obs-studio
    zoom-us
    pitivi
    kdenlive
    audacity
    spotify
  ];

  # some more or less advanced firefox configuration
  systemd.user.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
  programs.firefox = {
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
  };
}
