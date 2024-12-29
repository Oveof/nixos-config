{...}:
{
  programs.foot = {
    enable = true;
  };
  home.file.".config/foot" = {
    source = ./config;
    recursive = true;   # link recursively
    executable = true;  # make all files executable
  };
}
