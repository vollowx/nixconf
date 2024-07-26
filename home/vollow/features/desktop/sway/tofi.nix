{ colors, ... }:
{
  programs.tofi = {
    enable = true;
    settings = {
      font = "monospace";
      font-size = 10;

      horizontal = true;
      anchor = "top";
      width = "100%";
      height = 32;
      padding-left = 220;
      padding-right = 500;
      padding-top = 6;
      padding-bottom = 6;
      outline-width = 0;
      border-width = 0;
      background-color = "#00000000";
      text-color = "#${colors.overlay0}";

      prompt-text = "\"(run \"";
      prompt-background-padding = "0, 15";
      prompt-color = "#${colors.mauve}";

      input-color = "#${colors.teal}";

      result-spacing = 15;
      selection-color = "#${colors.text}";
      selection-match-color = "#${colors.text}";
    };
  };
}
