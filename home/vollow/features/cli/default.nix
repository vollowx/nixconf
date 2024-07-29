{ pkgs, ... }:
{
  imports = [
    ./direnv.nix
    ./starship.nix
    ./zoxide.nix
    ./bash.nix
    ./fish.nix
    ./bat.nix
    ./git.nix
    ./gh.nix
    ./nix-index.nix
    ./pfetch.nix
    ./ssh.nix
    ./fzf.nix
  ];
  home.packages = with pkgs; [
    comma # Install and run programs by sticking a , before them
    distrobox # Use stuffs on other distro
    nh # Nice wrapper for NixOS and HM
    nvd # Diff viewer for nh
    nom # Process monitor for nh

    bc # Calculator
    bottom # System viewer
    ncdu # TUI disk usage
    eza # Better ls
    ripgrep # Better grep
    fd # Better find
    httpie # Better curl
    diffsitter # Better diff
    timer # Bettwe sleep
    jq # JSON pretty printer and manipulator
    tmux # Terminal multiplexer

    gnumake
    gcc # C/C++
    clang-tools # C/C++ LSP, formatter and linter
    nodejs # JS/TS
    bun # JS/TS
    typescript-language-server # TypeScript LSP
    vscode-langservers-extracted # HTML, CSS and JSON LSP
    lua-language-server # Lua LSP
    stylua # Lua formatter
    yaml-language-server # YAML LSP
    nixd # Nix LSP
    nixfmt-rfc-style # Nix formatter
    efm-langserver # General-purpose LSP
    ltex-ls # Spell checking LSP

    speedtest-cli # Network speedtest by Ookla
  ];
}
