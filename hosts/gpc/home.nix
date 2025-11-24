{ pkgs, ... }:
{
  imports = [
    ../../home/gui.nix
  ];
  home.file.".config/hypr/monitors.conf" = {
    source = ./monitor/monitors.conf;
  };
  home.packages = with pkgs; [
    # niri
    xwayland-satellite
    fuzzel
    obs-studio
    swww
  ];
  # programs.niri.package = pkgs.niri;
  # services.displayManager.sessionPackages = [ pkgs.niri ];
}
