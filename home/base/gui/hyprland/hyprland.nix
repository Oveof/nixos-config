{
  pkgs,
  lib,
  ...
}: let
  package = pkgs.hyprland;
in {
  # NOTE:
  # We have to enable hyprland/i3's systemd user service in home-manager,
  # so that gammastep/wallpaper-switcher's user service can be start correctly!
  # they are all depending on hyprland/i3's user graphical-session
  wayland.windowManager.hyprland = {
    inherit package;
    enable = true;
    settings = {
      # source = "${nur-ryan4yin.packages.${pkgs.system}.catppuccin-hyprland}/themes/mocha.conf";
      env = [
        "NIXOS_OZONE_WL,1" # for any ozone-based browser & electron apps to run on wayland
        "MOZ_ENABLE_WAYLAND,1" # for firefox to run on wayland
        "MOZ_WEBRENDER,1"
        # misc
        "_JAVA_AWT_WM_NONREPARENTING,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORM,wayland"
        "SDL_VIDEODRIVER,wayland"
        "GDK_BACKEND,wayland"
      ];
    };
    systemd = {
      enable = false;
      variables = ["--all"];
    };
  };
  home.file.".config/hypr" = {
    source = ./config;
    recursive = true;   # link recursively
    executable = true;  # make all files executable
  };
  home.file.".wayland-session" = {
    source = "${pkgs.hyprland}/bin/Hyprland";
    executable = true;
  };

}
