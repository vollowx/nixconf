# nixos-help
# man 5 configuration.nix
# https://search.nixos.org/options
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix

    ../common/global
    ../common/users/vollow

    ../common/optional/systemd-boot.nix
    ../common/optional/tlp.nix
    ../common/optional/pipewire.nix
  ];

  networking.hostName = "neon";

  environment.pathsToLink = ["/libexec"];

  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";
  services.libinput.enable = true;
  services.libinput.touchpad = {
    naturalScrolling = true;
  };
  services.displayManager.defaultSession = "none+i3";
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3status
      i3lock
      i3blocks
      alacritty
      firefox
    ];
  };

  services.printing.enable = true;

  # nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    eza
    bat
    dust
    htop
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # man configuration.nix
  # https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  # Or simpler, do NOT modify.
  system.stateVersion = "24.11";
}
