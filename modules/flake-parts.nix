{ inputs, lib, config, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.modules ];

  options.meta = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "ove";
    };
    repoPath = lib.mkOption {
      type = lib.types.str;
      default = "/home/${config.meta.username}/repos/nixos-config";
      description = "Absolute path to this repo on disk (a string, so it is not copied to the store).";
    };
  };

  config.systems = [ "x86_64-linux" ];
}
