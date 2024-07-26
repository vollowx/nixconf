{
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };
  services.displayManager = {
    defaultSession = "none+i3";
  };
  services.libinput.touchpad.naturalScrolling = true;
}
