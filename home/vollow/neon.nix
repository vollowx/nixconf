{ pkgs, ... }:
{
  imports = [
    ./global
    ./features/desktop/sway
    ./features/games
    ./features/games/osu.nix
  ];

  # FIXME: Move into `features` or `global`
  home.packages = with pkgs; [
    obs-studio
    neovide
    qq
  ];
}
