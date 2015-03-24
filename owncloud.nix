{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.owncloud;
in
{
  options = {
    services.owncloud = {
      adminPassword = mkOption { type = types.str; };
      dbPassword = mkOption { type = types.str; };
    };
  };

  config = {

    environment.systemPackages = [ pkgs.owncloud pkgs.apacheHttpd pkgs.php ];

    services.postgresql.enable = true;
    services.postgresql.package = pkgs.postgresql;

    services.httpd.adminAddr = "foo@example.org";
    services.httpd.enable = true;
    services.httpd.enablePHP = true;
    services.httpd.virtualHosts = [{
      hostName = "owncloud.local";
      extraSubservices = with cfg; [{
        serviceType = "owncloud";
        inherit adminPassword dbPassword;
      }];
    }];
  };
}
