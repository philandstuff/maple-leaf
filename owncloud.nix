{ pkgs, ... }:
let
  owncloudPkg = (import ./owncloud/default.nix { inherit (pkgs) stdenv fetchurl php runCommand; });
in
{
  environment.systemPackages = [ owncloudPkg pkgs.apacheHttpd ];

  services.httpd.adminAddr = "foo@example.org";
  services.httpd.enable = true;
  services.httpd.extraConfig = ''
    Alias /owncloud ${owncloudPkg}
    <Directory ${owncloudPkg}>
     AllowOverride All
    </Directory>
  '';
}