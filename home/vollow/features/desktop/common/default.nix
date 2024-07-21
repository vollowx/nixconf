{ pkgs, colors, ... }:
let
  is_dark = colors.type == "dark";
in
{
  imports = [
    ./alacritty.nix
    ./discord.nix
    ./firefox.nix
    ./font.nix
    ./gtk.nix
    ./qt.nix
  ];

  home.packages = [ pkgs.libnotify ];

  # Also sets org.freedesktop.appearance color-scheme
  dconf.settings."org/gnome/desktop/interface".color-scheme =
    if is_dark then "prefer-dark" else "prefer-light";

  xdg.portal.enable = true;
}
