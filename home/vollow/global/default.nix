{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ../features/cli
    ../features/neovim
    ../features/emacs
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
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
    sessionPath = [ "$HOME/.local/bin" ];
  };

  i18n.inputMethod.fcitx5.catppuccin.enable = true;
  programs.alacritty.catppuccin.enable = true;
  programs.fish.catppuccin.enable = true;
  programs.fzf.catppuccin.enable = true;
  programs.git.delta.catppuccin.enable = true;
  programs.starship.catppuccin.enable = true;
  programs.tmux.catppuccin.enable = true;
  programs.tofi.catppuccin.enable = true;
  services.dunst.catppuccin.enable = true;
  wayland.windowManager.sway.catppuccin.enable = true; # FIXME: Doesn't work at all, it's overriden by the later config
}
