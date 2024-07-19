{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./mindustry.nix
    ./prism-launcher.nix
  ];
  home.packages = with pkgs; [gamescope];
}
