{
  programs.starship = {
    enable = true;
  };
  home.file.".config/starship.toml" = {
    source = ./config/starship.toml;
    # recursive = true;   # link recursively
    # executable = true;  # make all files executable
  };
}
