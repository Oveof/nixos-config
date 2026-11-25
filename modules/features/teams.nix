{
  flake.modules.nixos.teams = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.teams-for-linux ];
  };
}
