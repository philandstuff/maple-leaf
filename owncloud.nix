{ pkgs, ... }:
let
  owncloudPkg = (import ./owncloud/default.nix { inherit (pkgs) fetchurl runCommand; });
in
{
  environment.systemPackages = [ owncloudPkg pkgs.apacheHttpd pkgs.php ];

  services.httpd.adminAddr = "foo@example.org";
  services.httpd.enable = true;
  services.httpd.enablePHP = true;
  services.httpd.extraConfig = ''
    Alias /owncloud ${owncloudPkg}
    <Directory ${owncloudPkg}>
     AllowOverride All
    </Directory>
  '';
}
