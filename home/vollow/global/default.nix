{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports =
    [
      ../features/git.nix
      ../features/neovim.nix
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = lib.mkDefault "vollow";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "24.11";
    sessionPath = ["$HOME/.local/bin"];
  };
}
