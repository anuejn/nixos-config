{
  network.storage.legacy = {
    databasefile = "~/.nixops/deployments.nixops";
  };

  niemode =
    { config, pkgs, ... }:
    {
      imports = [ ./hosts/niemode/configuration.nix ];
      deployment.targetHost = "45.142.177.123";
    };

  pink =
    { config, pkgs, ... }:
    {
      imports = [ ./hosts/pink/configuration.nix ];
      deployment.targetHost = "localhost";
    };
}
