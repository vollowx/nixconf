{pkgs, ...}: {
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "FiraCode Nerd Font"
          "Noto Sans Mono CJK SC"
          "Noto Color Emoji"
        ];
        sansSerif = ["FireSans" "Noto Sans" "Noto Sans CJK SC" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Serif CJK SC" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-extra
    noto-fonts-emoji
    fira-sans
    (nerdfonts.override {fonts = ["FiraCode"];})
  ];
}
