{...}:
{
  programs.waybar = {
    enable = true;
  };
  home.file.".config/waybar" = {
    source = ./config;
    recursive = true;   # link recursively
    executable = true;  # make all files executable
  };
}
