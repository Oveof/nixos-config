{ ... }:
{
  home.file.".config/niri" = {
    source = ./config;
    recursive = true; # link recursively
    executable = true; # make all files executable
  };
}
