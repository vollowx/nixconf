{pkgs, ...}: {
  programs.firefox = {
    enable = true;
  };

  home.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = ["firefox.desktop"];
    "text/xml" = ["firefox.desktop"];
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
  };
}
