{ config, pkgs, ... }:
let
  dual-function-yaml = pkgs.writeText "dual-function.yaml" ''
    MAPPINGS:
      - KEY: KEY_SPACE
        TAP: KEY_SPACE
        HOLD: KEY_LEFTSHIFT
      - KEY: KEY_CAPSLOCK
        TAP: KEY_ESC
        HOLD: KEY_CAPSLOCK
  '';
in
{
  services.interception-tools = {
    enable = true;
    plugins = with pkgs.interception-tools-plugins; [ dual-function-keys ];
    udevmonConfig = ''
      - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.dual-function-keys}/bin/dual-function-keys -c ${dual-function-yaml} | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
        DEVICE:
          EVENTS:
            EV_KEY: [KEY_SPACE, KEY_CAPSLOCK]
    '';
  };
}
