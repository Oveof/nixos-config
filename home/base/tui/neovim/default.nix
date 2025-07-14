{config, ...}:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink /home/ove/repos/nixos-config/home/base/tui/neovim/nvim;
    recursive = true;
  };
}
