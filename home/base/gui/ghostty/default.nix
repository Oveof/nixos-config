{
  programs.ghostty = {
    enable = true;
  };

  home.file.".config/ghostty" = {
    source = ./config;
    recursive = true; # link recursively
    executable = true; # make all files executable
  };
}
