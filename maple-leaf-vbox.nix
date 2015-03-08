{
  maple-leaf =
    { config, pkgs, ... }:
    { deployment.targetEnv = "virtualbox";
      deployment.virtualbox.memorysize = 768;
    };
}
