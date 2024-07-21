{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.inputs.neovim-nightly-overlay.neovim;
  };
}
