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
      font.size = 14;
      cursor.style.shape = "Underline";
    };
  };
}
