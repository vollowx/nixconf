{
  inputs,
  outputs,
  colors,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./systemd-initrd.nix
    ./console.nix
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
    inherit inputs outputs colors;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
}
