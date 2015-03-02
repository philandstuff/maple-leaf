{ pkgs, ...}:
{
  environment.systemPackages = [ pkgs.tarsnap ];
}
