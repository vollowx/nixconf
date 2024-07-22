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
    distrobox # Nice escape hatch, integrates docker images with my environment
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
    jq # JSON pretty printer and manipulator
    timer # To help with my ADHD paralysis

    gnumake
    clang # C/C++
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

    lazygit
    speedtest-cli # Network speedtest by Ookla
  ];
}
