{
  pkgs,
  config,
  lib,
  ...
}:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.vollow = {
    isNormalUser = true;
    shell = pkgs.fish;
    home = "/home/vollow";
    createHome = true;
    description = "Vollow";
    extraGroups = ifTheyExist [
      "networkmanager"
      "wheel"
    ];
    packages = [ pkgs.home-manager ];
  };

  home-manager.users.vollow = import ../../../../home/vollow/${config.networking.hostName}.nix;
}
