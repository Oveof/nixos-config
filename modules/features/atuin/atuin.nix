{ inputs, ... }:
{
  flake.modules.nixos.atuin = {
    home-manager.sharedModules = [ inputs.self.modules.homeManager.atuin ];
  };

  flake.modules.homeManager.atuin = {
    programs.atuin = {
      enable = true;
      enableNushellIntegration = true;
    };
    xdg.configFile."atuin/config.toml".source = ./config.toml;
  };
}
