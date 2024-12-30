{config, ...}:
{
  programs.neovim = {
    enable = true;
  };
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ./nvim;
    recursive = true;   # link recursively
    executable = true;  # make all files executable
  };
}
