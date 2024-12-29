{
  programs.fish = {
    enable = true;
  };
  home.file.".config/fish" = {
    source = ./config;
    recursive = true;   # link recursively
    executable = true;  # make all files executable
  };
}
