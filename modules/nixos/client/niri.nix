{
  pkgs,
  config,
  lib,
  username,
  ...
}:
{
  # Packages (leave as you have them)
  environment.systemPackages = with pkgs; [
    # fuzzel
    # quickshell
    # xwayland-satellite
    xdg-desktop-portal-gnome

    # swww
  ];

  programs.obs-studio.enable = true;

  # If Niri is now managed by Home Manager, start the HM session wrapper:
  services.greetd = {
    enable = true;
    settings.default_session = {
      user = username;
      command = "niri-session"; # HM generates this
      # or: "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd $HOME/.wayland-session"
    };
  };

  programs.niri.enable = true;
  xdg.portal = {
    enable = true;
  };
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
