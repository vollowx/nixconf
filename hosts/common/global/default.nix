{
  inputs,
  outputs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.catppuccin.nixosModules.catppuccin
    ./systemd-initrd.nix
    ./fish.nix
    ./gamemode.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./nix-ld.nix
    ./openssh.nix
    ./steam-hardware.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;

  console.catppuccin.enable = true;
}
