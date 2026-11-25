{ config, inputs, ... }:
let
  inherit (config.meta) repoPath;
in
{
  flake.modules.nixos.neovim = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    home-manager.sharedModules = [ inputs.self.modules.homeManager.neovim ];
  };

  flake.modules.homeManager.neovim = { config, pkgs, ... }: {
    xdg.configFile."nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${repoPath}/modules/features/neovim/config";

    # Tools plugins expect on PATH (telescope, treesitter, LSPs).
    home.packages = with pkgs; [
      ripgrep
      fd
      gcc
      tree-sitter
      lua-language-server
      nil
    ];
  };
}
