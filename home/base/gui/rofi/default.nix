{...}:
{
  programs.rofi = {
    enable = true;
  };
  home.file.".config/rofi" = {
    source = ./config;
    recursive = true;   # link recursively
    executable = true;  # make all files executable
  };
}
