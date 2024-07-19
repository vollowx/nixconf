{
  config,
  pkgs,
  lib,
  ...
}: {
  gtk = {
    enable = true;
    # font = {
    #   name = config.fontProfiles.regular.family;
    #   size = 12;
    # };
    # theme = let
    #   inherit (config.colorscheme) mode colors;
    #   name = "generated-${hashString "md5" (toJSON colors)}-${mode}";
    # in {
    #   inherit name;
    #   package = materiaTheme name (
    #     lib.mapAttrs (_: v: lib.removePrefix "#" v) colors
    #   );
    # };
    # iconTheme = {
    #   name = "Papirus";
    #   package = pkgs.papirus-icon-theme;
    # };
  };

  services.xsettingsd = {
    enable = true;
    # settings = {
    #   "Net/ThemeName" = "${gtk.theme.name}";
    #   "Net/IconThemeName" = "${gtk.iconTheme.name}";
    # };
  };

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
