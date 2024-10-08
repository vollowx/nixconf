{ pkgs, inputs, ... }:
{
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware.nix

    ../common/global
    ../common/users/vollow

    ../common/optional/systemd-boot.nix
    ../common/optional/tlp.nix
    ../common/optional/pipewire.nix
    ../common/optional/swaylock.nix
    ../common/optional/udisks2.nix
  ];

  networking.hostName = "neon";

  # boot = {
  #   kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
  #   binfmt.emulatedSystems = [
  #     "aarch64-linux"
  #     "i686-linux"
  #   ];
  # };

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver

      libva
      libva-vdpau-driver
      libvdpau-va-gl

      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];
  };

  system.stateVersion = "24.11";
}
