{
  outputs,
  lib,
  config,
  ...
}: {
  programs.ssh = {
    enable = true;
  };
}
