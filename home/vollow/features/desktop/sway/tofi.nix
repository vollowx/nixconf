{ colors, ... }:
{
  programs.tofi = {
    enable = true;
    settings = {
      font = "monospace";
      font-size = 16;

      width = "100%";
      height = "100%";
      padding-left = "32%";
      padding-top = "28%";
      outline-width = 0;
      border-width = 0;
      background-color = "#${colors.mantle}ee";
      text-color = "#${colors.overlay0}";

      prompt-text = "\"Application> \"";
      prompt-color = "#${colors.blue}";

      input-color = "#${colors.text}";

      num-results = 15;
      result-spacing = 5;
      selection-color = "#${colors.red}";
      selection-match-color = "#${colors.red}";
    };
  };
}
