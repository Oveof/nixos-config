{...}: 
{
  programs.hyprlock.enable = true;
  home.file.".config/hypr/hyprlock.conf" = {
    source = ./hyprlock_config/hyprlock.conf;
    executable = true;
  };
  home.file.".config/hypr/hyprlock.png" = {
    source = ../../../../wallpapers/background.png;
    executable = true;
  };
}
