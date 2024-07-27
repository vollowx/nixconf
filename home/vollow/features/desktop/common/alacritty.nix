{ colors, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        dynamic_padding = true;
      };
      font.size = 16;
      cursor.style.shape = "Underline";
      colors = {
        primary = {
          background = "#${colors.base}";
          foreground = "#${colors.text}";
          dim_foreground = "#${colors.overlay1}";
          bright_foreground = "#${colors.text}";
        };
        cursor = {
          text = "#${colors.base}";
          cursor = "#${colors.rosewater}";
        };
        vi_mode_cursor = {
          text = "#${colors.base}";
          cursor = "#${colors.lavender}";
        };
        search.matches = {
          foreground = "#${colors.base}";
          background = "#${colors.subtext0}";
        };
        search.focused_match = {
          foreground = "#${colors.base}";
          background = "#${colors.green}";
        };
        footer_bar = {
          foreground = "#${colors.base}";
          background = "#${colors.subtext0}";
        };
        hints.start = {
          foreground = "#${colors.base}";
          background = "#${colors.yellow}";
        };
        hints.end = {
          foreground = "#${colors.base}";
          background = "#${colors.subtext0}";
        };
        selection = {
          text = "#${colors.base}";
          background = "#${colors.rosewater}";
        };
        normal = {
          black = "#${colors.surface1}";
          red = "#${colors.red}";
          green = "#${colors.green}";
          yellow = "#${colors.yellow}";
          blue = "#${colors.blue}";
          magenta = "#${colors.pink}";
          cyan = "#${colors.teal}";
          white = "#${colors.subtext1}";
        };
        bright = {
          black = "#${colors.surface2}";
          red = "#${colors.red}";
          green = "#${colors.green}";
          yellow = "#${colors.yellow}";
          blue = "#${colors.blue}";
          magenta = "#${colors.pink}";
          cyan = "#${colors.teal}";
          white = "#${colors.subtext0}";
        };
        dim = {
          black = "#${colors.surface1}";
          red = "#${colors.red}";
          green = "#${colors.green}";
          yellow = "#${colors.yellow}";
          blue = "#${colors.blue}";
          magenta = "#${colors.pink}";
          cyan = "#${colors.teal}";
          white = "#${colors.subtext1}";
        };
        indexed_colors = [
          {
            index = 16;
            color = "#${colors.peach}";
          }
          {
            index = 17;
            color = "#${colors.rosewater}";
          }
        ];
      };
    };
  };
}
