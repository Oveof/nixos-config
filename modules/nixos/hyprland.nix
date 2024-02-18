{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # xwayland.hidpi = true;
  };
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
}