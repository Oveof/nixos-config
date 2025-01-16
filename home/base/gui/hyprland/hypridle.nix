{pkgs, ...}: 
{
  home.packages = [ pkgs.hypridle ];
  home.file.".config/hypr/hypridle.conf" = {
    source = ./hypridle_config/hypridle.conf;
    executable = true;
  };
}
