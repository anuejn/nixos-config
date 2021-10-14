# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, pkgs, ... }:
let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/input-sources" = {
        per-window = false;
        show-all-sources = true;
        sources = [ (mkTuple [ "xkb" "de+adnw" ]) (mkTuple [ "xkb" "us" ]) ];
        xkb-options = [ "terminate:ctrl_alt_bksp" "lv3:ralt_switch" "ctrl:swap_lalt_lctl" ];
      };

      "org/gnome/desktop/peripherals/touchpad" = {
        speed = 0.55;
        two-finger-scrolling-enabled = true;
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>q" ];
        switch-input-source = [ ];
        switch-input-source-backward = [ ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-5 = [ "<Super>5" ];
        switch-to-workspace-6 = [ "<Super>6" ];
        switch-to-workspace-7 = [ "<Super>7" ];
        switch-to-workspace-8 = [ "<Super>8" ];
        switch-to-workspace-9 = [ "<Super>9" ];
        switch-to-workspace-10 = [ "<Super>0" ];
      };

      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 10;
        workspace-names = [ ];
      };

      "org/gnome/mutter" = {
        attach-modal-dialogs = true;
        dynamic-workspaces = false;
        edge-tiling = true;
        workspaces-only-on-primary = true;
      };

      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = [ ];
        switch-to-application-2 = [ ];
        switch-to-application-3 = [ ];
        switch-to-application-4 = [ ];
        switch-to-application-5 = [ ];
        switch-to-application-6 = [ ];
        switch-to-application-7 = [ ];
        switch-to-application-8 = [ ];
        switch-to-application-9 = [ ];
        switch-to-application-10 = [ ];
      };
      "org/gnome/shell".disable-user-extensions = false;
    };
  };
}
