{...}:
{
  programs.atuin = {
    enable = true;
  };
  home.file.".config/atuin" = {
    source = ./config;
    recursive = true;   # link recursively
    executable = true;  # make all files executable
  };
}
