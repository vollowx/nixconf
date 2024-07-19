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

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    binfmt.emulatedSystems = [
      "aarch64-linux"
      "i686-linux"
    ];
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };
  services.displayManager = {
    defaultSession = "none+i3";
  };
  services.libinput.touchpad.naturalScrolling = true;

  system.stateVersion = "24.11";
}
