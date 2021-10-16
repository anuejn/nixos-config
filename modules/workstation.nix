{ config, pkgs, ... }: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    desktopManager.gnome.enable = true;
  };
  services.dbus.packages = [ pkgs.gnome3.dconf ];
  services.udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
  services.gnome.chrome-gnome-shell.enable = true; # this is for the firefox extentions support
  programs = {
    dconf.enable = true;
    xwayland.enable = true;
  };

  services.printing.enable = true;

  zramSwap.enable = true;
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 1;
    enableNotifications = true; # TODO: actually display these notifications
  };

  services.avahi = {
    nssmdns = true;
    enable = true;
    ipv4 = true;
    ipv6 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };
}
