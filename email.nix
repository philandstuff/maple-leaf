{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.email;
in
{
  options = {
    services.email = {
      domain = mkOption {
        type = types.str;
      };
    };
  };

  config = {
    services.postfix.enable = true;
    services.postfix.hostname = cfg.domain;
  };
}
