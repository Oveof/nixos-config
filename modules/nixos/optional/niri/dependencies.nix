{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fuzzel
    xwayland-satellite
    xdg-desktop-portal-gnome
    flameshot
    mako
    libvterm
    wl-clipboard
    hyprlock
    cliphist
  ];

}
