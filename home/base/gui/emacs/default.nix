{ config, ... }:
{
  programs.emacs = {
    enable = true;
  };
  home.file.".doom.d" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/ove/repos/nixos-config/home/base/gui/emacs/config";
    recursive = true;
  };
}
