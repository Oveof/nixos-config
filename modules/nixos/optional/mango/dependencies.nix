{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fuzzel # launcher
    xwayland-satellite
    flameshot # screenshot
    mako # Notification daemon
    wl-clipboard # Wayland clipboard
    cliphist # Clipboard history
  ];

}
