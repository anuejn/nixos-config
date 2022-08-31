{ pkgs, ... }:
{
  imports = [
    ./nextcloud.nix
    # ./hedgedoc.nix
  ];

  security.acme = {
    acceptTerms = true;
    email = "jarohabiger@googlemail.com";
  };

  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    # Only allow PFS-enabled ciphers with AES256
    sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";
  };
}
