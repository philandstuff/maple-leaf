{ pkgs, ... }:
let
  dbPassword = "CHANGEME";
  adminPassword = "CHANGEME";
in
{
  environment.systemPackages = [ pkgs.owncloud pkgs.apacheHttpd pkgs.php ];

  services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql;

  services.httpd.adminAddr = "foo@example.org";
  services.httpd.enable = true;
  services.httpd.enablePHP = true;
  services.httpd.virtualHosts = [{
    hostName = "owncloud.local";
    extraSubservices = [{
      serviceType = "owncloud";
      inherit adminPassword dbPassword;
    }];
  }];
}
