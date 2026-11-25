{ inputs, config, ... }:
let
  inherit (config.meta) username;
in
{
  # NixOS-side wiring for home-manager. Features add their HM halves
  # through `home-manager.sharedModules`.
  flake.modules.nixos.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "hm-backup";
      sharedModules = [ inputs.self.modules.homeManager.base ];
      users.${username} = { };
    };
  };
}
