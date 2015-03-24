{
  maple-leaf =
    { config, pkgs, ... }:
    {
      imports = [ ./tarsnap.nix ./owncloud.nix ./email.nix ];

      config.services.email.domain = "CHANGEME";
      config.services.owncloud.adminPassword = "CHANGEME";
      config.services.owncloud.dbPassword = "CHANGEME";
    };
}
