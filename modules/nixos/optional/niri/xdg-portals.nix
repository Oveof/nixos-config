{ pkgs, ... }:
{

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # for gtk
      xdg-desktop-portal-gnome
      kdePackages.xdg-desktop-portal-kde
      # xdg-desktop-portal-kde  # for kde
    ];
  };
}
