{pkgs, ...}: {
  imports = [
    ./global
    ./features/desktop/i3
    ./features/games
  ];

  home.packages = with pkgs; [
    gnumake
    clang
    nodejs
    bun
    lua-language-server
    gitu
    speedtest-cli

    obs-studio
    neovide
    qq
  ];
}
