{ inputs, ... }:
{
  flake.modules.nixos.jujutsu = {
    home-manager.sharedModules = [ inputs.self.modules.homeManager.jujutsu ];
  };

  flake.modules.homeManager.jujutsu = { pkgs, ... }: {
    home.packages = [ pkgs.jujutsu ];
    xdg.configFile."jj/config.toml".source = ./config.toml;
  };
}
