{ inputs, ... }:
{
  flake.modules.nixos.terminal = {
    home-manager.sharedModules = [ inputs.self.modules.homeManager.terminal ];
  };

  flake.modules.homeManager.terminal = {
    programs.foot.enable = true;
    programs.zsh.enable = true;
  };
}
