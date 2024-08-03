{ pkgs, colors, ... }:
let
  is_dark = colors.type == "dark";
in
{
  imports = [
    ./gtk.nix
    ./qt.nix

    ./alacritty.nix
    ./discord.nix
    ./fcitx5.nix
    ./firefox.nix
    ./font.nix
    ./gimp.nix
    ./tauon.nix
  ];

  home.packages = [ pkgs.libnotify ];

  # Also sets org.freedesktop.appearance color-scheme
  dconf.settings."org/gnome/desktop/interface".color-scheme =
    if is_dark then "prefer-dark" else "prefer-light";

  home.pointerCursor = {
    name = "macOS-Monterey";
    package = pkgs.apple-cursor;
    gtk.enable = true;
    size = 24;
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    portal = {
      enable = true;
    };
  };
}
