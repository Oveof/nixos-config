{...}: 
{
  imports = [
    ../../home/gui.nix
  ];
  wayland.windowManager.hyprland = {
    monitor = "eDP-1,highres,auto,1.5,bitdepth,10";
  };
}
