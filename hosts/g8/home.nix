{...}: 
{
  imports = [
    ../../home/gui.nix
    ../../home/work
  ];
  home.file.".config/hypr/monitors.conf" = {
    source = ./monitor/monitors.conf;
  };
}
