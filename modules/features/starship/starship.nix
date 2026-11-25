{ inputs, ... }:
{
  flake.modules.nixos.starship = {
    home-manager.sharedModules = [ inputs.self.modules.homeManager.starship ];
  };

  flake.modules.homeManager.starship = {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
    };
    xdg.configFile."starship.toml".source = ./starship.toml;
  };
}
