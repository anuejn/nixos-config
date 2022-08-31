{ config, pkgs, ... }: {
  imports = [
    ./interception-tools.nix
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    desktopManager.gnome.enable = true;
  };
  services.dbus.packages = [ pkgs.dconf ];
  services.udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
  services.gnome.chrome-gnome-shell.enable = true; # this is for the firefox extentions support
  programs = {
    dconf.enable = true;
    xwayland.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = [
    config.boot.kernelPackages.v4l2loopback.out
  ];

  fonts.fonts = with pkgs; [ google-fonts corefonts ];
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ uniemoji typing-booster ];
  };

  services.printing = {
    enable = true;
  };
  
  services.flatpak.enable = true;

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

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    config.pipewire = {
      "context.properties" = {
        "link.max-buffers" = 16;
        "log.level" = 2;
      };

      media-session.config.bluez-monitor.rules = [
        {
          # Matches all cards
          matches = [{ "device.name" = "~bluez_card.*"; }];
          actions = {
            "update-props" = {
              "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
              # mSBC is not expected to work on all headset + adapter combinations.
              "bluez5.msbc-support" = true;
              # SBC-XQ is not expected to work on all headset + adapter combinations.
              "bluez5.sbc-xq-support" = true;
            };
          };
        }
        {
          matches = [
            # Matches all sources
            { "node.name" = "~bluez_input.*"; }
            # Matches all outputs
            { "node.name" = "~bluez_output.*"; }
          ];
          actions = {
            "node.pause-on-idle" = false;
          };
        }
      ];
    };
  };
}
