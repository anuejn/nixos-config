{ pkgs, ... }:
{
  services.nginx.virtualHosts."md.niemo.de" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyWebsockets = true;
    locations."/".proxyPass = "unix:/run/hedgedoc.sock";
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "hedgedoc" ];
    ensureUsers = [{
      name = "hedgedoc";
      ensurePermissions."DATABASE hedgedoc" = "ALL PRIVILEGES";
    }];
  };

  services.hedgedoc = {
    enable = true;
    configuration = {
      path = "/run/hedgedoc.sock";
      allowEmailRegister = false;
      domain = "md.niemo.de";
      db = {
        dialect = "postgres";
        host = "/run/postgresql";
        database = "hedgedoc";
      };
      allowAnonymousEdits = false;
      allowFreeURL = true;
    };

  };
}
