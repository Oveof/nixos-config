{config, ...}:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink /home/ove/Repos/nixos-config/home/base/tui/neovim/nvim;
    recursive = true;
  };
}
