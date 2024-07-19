{pkgs, ...}: {
  imports = [
    ./bash.nix
    ./bat.nix
    ./direnv.nix
    ./fish.nix
    ./gh.nix
    ./git.nix
    ./nix-index.nix
    ./pfetch.nix
    ./ssh.nix
    ./starship.nix
    ./fzf.nix
  ];
  home.packages = with pkgs; [
    comma # Install and run programs by sticking a , before them
    distrobox # Nice escape hatch, integrates docker images with my environment

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

    nixd # Nix LSP
    alejandra # Nix formatter
    nixfmt-rfc-style
    nvd # Differ
    nix-diff # Differ, more detailed
    nix-output-monitor
    nh # Nice wrapper for NixOS and HM

    ltex-ls # Spell checking LSP

    speedtest-cli # Speedtest by Ookla
  ];
}
