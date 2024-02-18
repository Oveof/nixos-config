{ pkgs, ... }:
{
  imports = [
    ./swaylock.nix
    ./waybar.nix
    ./wofi.nix
    ./zathura.nix
    ./foot.nix
  ];

  xdg.mimeApps.enable = true;
  home.packages = with pkgs; [
    grim
    gtk3 # For gtk-launch
    imv
    mimeo
    primary-xwayland
    slurp
    wf-recorder
    wl-clipboard
    wl-mirror
    wl-mirror-pick
    xdg-utils-spawn-terminal # Patched to open terminal
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
}
