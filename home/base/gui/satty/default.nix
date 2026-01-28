{ pkgs, ... }:
{
  home.packages = [ pkgs.satty ];

  home.file.".config/satty" = {
    source = ./config;
    recursive = true; # link recursively
    executable = true; # make all files executable
  };
}
