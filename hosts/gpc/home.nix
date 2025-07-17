{...}:
{
  imports = [
    ../../home/gui.nix
  ];
  home.file.".config/hypr/monitors.conf" = {
    source = ./monitor/monitors.conf;
  };
}
