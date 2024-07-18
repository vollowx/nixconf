{pkgs, ...}: {
  imports = [
    ./global
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

    steam
    mindustry
    prismlauncher
  ];
}
