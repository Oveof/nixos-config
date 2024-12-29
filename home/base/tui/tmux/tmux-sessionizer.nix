{pkgs, ...}:
{
  home.packages = [ pkgs.tmux-sessionizer ];
  home.file.".config/tms" = {
    source = ./tms-config;
    recursive = true;   # link recursively
    executable = true;  # make all files executable
  };
}
