{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme = {
      name = "gtk3";
      package = pkgs.qt6.qtbase;
    };
  };
}
