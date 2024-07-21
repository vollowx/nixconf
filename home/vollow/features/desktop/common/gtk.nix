{
  config,
  pkgs,
  colors,
  ...
}:
let
  is_dark = colors.type == "dark";
in
{
  gtk = {
    enable = true;
    theme = {
      name = if is_dark then "adw-gtk3-dark" else "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = if is_dark then "Papirus-Dark" else "Papirus-Light";
      package = pkgs.papirus-icon-theme;
    };
    gtk2.configLocation = "/home/vollow/.config/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = if is_dark then 1 else 0;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = if is_dark then 1 else 0;
  };

  services.xsettingsd = {
    enable = true;
    settings = {
      "Net/ThemeName" = "${config.gtk.theme.name}";
      "Net/IconThemeName" = "${config.gtk.iconTheme.name}";
    };
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
