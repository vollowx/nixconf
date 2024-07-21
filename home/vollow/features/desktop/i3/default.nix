{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [ ../common ];

  home.packages = with pkgs; [ alacritty ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      gaps = {
        inner = 10;
        outer = 5;
      };
      keybindings =
        let
          modifier = config.xsession.windowManager.i3.config.modifier;
        in
        lib.mkOptionDefault {
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";

          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";

          "${modifier}+b" = "split h";
        };
      modifier = "Mod4";
      startup = [ { command = "fcitx5 -rd"; } ];
      terminal = "alacritty";
    };
  };
}
