{
  pkgs,
  config,
  lib,
  username,
  ...
}:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
}
