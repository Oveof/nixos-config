{...}:
{
  programs.neovim = {
    enable = true;
  };
  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;   # link recursively
    executable = true;  # make all files executable
  };
}
