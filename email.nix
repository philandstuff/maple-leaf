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
    services.dovecot2.enable = true;

    services.postfix.enable = true;
    services.postfix.hostname = cfg.domain;
  };
}
