{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ../common
    ./tofi.nix
    ./dunst.nix
  ];

  home = {
    packages = with pkgs; [
      wf-recorder
      wl-clipboard
      xdg-utils
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      DISABLE_QT5_COMPAT = "0";
      QT_QPA_PLATFORM = "wayland;xcb";
      GDK_BACKEND = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      MOZ_ENABLE_WAYLAND = "1";
      XDG_SESSION_TYPE = "wayland";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false; # FIXME: Shouldn't exist. For bg only
    systemd.enable = true;
    extraSessionCommands = ''
      export XDG_CURRENT_DESKTOP=sway;
    '';
    wrapperFeatures.gtk = true;
    config = {
      floating = {
        titlebar = false;
        border = 2;
        modifier = "Mod4";
      };
      gaps = {
        inner = 10;
        outer = 5;
      };
      input = {
        "type:keyboard" = {
          xkb_layout = "us";
          repeat_delay = "200";
          repeat_rate = "30";
        };
        "type:mouse" = {
          dwt = "disabled";
          accel_profile = "flat";
        };
        "type:touchpad" = {
          dwt = "disabled";
          tap = "enabled";
          natural_scroll = "enabled";
          accel_profile = "adaptive";
          scroll_factor = "0.45";
          pointer_accel = "0.27";
        };
      };
      startup = [ { command = "fcitx5 -rd"; } ];
      bars = [ ];
      defaultWorkspace = "workspace 1";
      keybindings =
        let
          mod = "Mod4";
          concatAttrs = lib.fold (x: y: x // y) { };
          tagBinds = concatAttrs (
            map (i: {
              "${mod}+${toString i}" = "workspace ${toString i}";
              "${mod}+Shift+${toString i}" = "move container to workspace ${toString i}";
            }) (lib.range 1 9)
          );
        in
        tagBinds
        // {
          "${mod}+o" = "exec ${lib.getExe pkgs.hyprpicker} -a -n";
          "${mod}+0" = "exec swaylock -f";

          # FIXME: Replace 00000080 with colors.mantle
          "print" = ''exec ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp} -b 00000080 -c 00000000)" -| wl-copy -t image/png'';
          "Shift+print" = "exec ${lib.getExe pkgs.grim} -c - | wl-copy -t image/png";

          # FIXME: Replace 00000080 with colors.mantle
          "Alt+print" = ''exec ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp} -b 00000080 -c 00000000)" ~/pictures/screenshots/$(date "+%Y%m%d"_"%Hh%Mm%Ss"_grim).png'';
          "Shift+Alt+print" = ''exec ${lib.getExe pkgs.grim} -c ~/pictures/screenshots/$(date "+%Y%m%d"_"%Hh%Mm%Ss"_grim).png '';

          "${mod}+Return" = "exec alacritty";
          "${mod}+d" = "exec $(tofi-run)";
          "${mod}+Shift+q" = "kill";

          "${mod}+q" = "exec notify-status";

          "XF86AudioMute" = "exec volume -t";
          "XF86AudioRaiseVolume" = "exec volume -i 5";
          "XF86AudioLowerVolume" = "exec volume -d 5";

          "${mod}+XF86AudioRaiseVolume" = "exec volume -i 1";
          "${mod}+XF86AudioLowerVolume" = "exec volume -d 1";

          "XF86AudioNext" = "exec ${lib.getExe pkgs.playerctl} next";
          "XF86AudioPrev" = "exec ${lib.getExe pkgs.playerctl} previous";
          "XF86AudioPlay" = "exec ${lib.getExe pkgs.playerctl} play-pause";

          "XF86MonBrightnessDown" = "exec brightness set 5%-";
          "XF86MonBrightnessUp" = "exec brightness set 5%+";

          "${mod}+XF86MonBrightnessDown" = "exec brightness set 1%-";
          "${mod}+XF86MonBrightnessUp" = "exec brightness set 1%+";

          "${mod}+r" = ''mode "resize"'';
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";
          "${mod}+e" = "layout toggle split";
          "${mod}+w" = "layout tabbed";
          "${mod}+b" = "splith";
          "${mod}+v" = "splitv";
          "${mod}+f" = "fullscreen";
          "${mod}+a" = "focus parent";
          "${mod}+p" = "sticky toggle";
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";
          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";
          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+e" = "exit";
        };
      seat = {
        "*".hide_cursor = "when-typing enable";
      };
      output = {
        "eDP-1" = {
          scale = "1";
          bg = "~/Downloads/beach-and-girls.png fill";
        };
      };
    };
  };
  programs.swaylock = {
    enable = true;
    settings = {
      no-unlock-indicator = true;
      ignore-empty-password = true;
      color = "000000";
    };
  };
}
