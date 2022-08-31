{ pkgs, ... }:
{
  services.nginx.virtualHosts."wolke.niemo.de" = {
    forceSSL = true;
    enableACME = true;
  };

  services.nextcloud = {
    package = pkgs.nextcloud23;
    enable = true;
    hostName = "wolke.niemo.de";
    https = true;
    autoUpdateApps.enable = true;
    autoUpdateApps.startAt = "05:00:00";
    caching.redis = true;

    poolSettings = {
      "pm" = "dynamic";
      "pm.max_children" = 200;
      "pm.max_requests" = 1000;
      "pm.start_servers" = 50;
      "pm.min_spare_servers" = 50;
      "pm.max_spare_servers" = 150;
    };

    phpOptions = {
      short_open_tag = "Off";
      expose_php = "Off";
      error_reporting = "E_ALL & ~E_DEPRECATED & ~E_STRICT";
      display_errors = "stderr";
      "opcache.enable_cli" = "1";
      "opcache.enable" = "1";
      "opcache.interned_strings_buffer" = "8";
      "opcache.max_accelerated_files" = "10000";
      "opcache.memory_consumption" = "128";
      "opcache.save_comments" = "1";
      "opcache.revalidate_freq" = "1";
      "opcache.fast_shutdown" = "1";
      "openssl.cafile" = "/etc/ssl/certs/ca-certificates.crt";
      catch_workers_output = "yes";
    };

    config = {
      overwriteProtocol = "https";

      # Nextcloud PostegreSQL database configuration, recommended over using SQLite
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql"; # nextcloud will add /.s.PGSQL.5432 by itself
      dbname = "nextcloud";
      dbpassFile = "/var/nextcloud-db-pass";

      adminpassFile = "/var/nextcloud-admin-pass";
      adminuser = "admin";
    };
  };

  services.redis = {
    enable = true;
  };

  services.postgresql = {
    enable = true;

    # Ensure the database, user, and permissions always exist
    ensureDatabases = [ "nextcloud" ];
    ensureUsers = [
      {
        name = "nextcloud";
        ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
      }
    ];
  };

  systemd.services."nextcloud-setup" = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };

}
