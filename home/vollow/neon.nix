{ pkgs, ... }:
{
  imports = [
    ./global
    ./features/desktop/i3
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
