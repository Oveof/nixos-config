{ config, inputs, ... }:
let
  inherit (config.meta) username repoPath;
in
{
  flake.modules.nixos.mango = { pkgs, ... }: {
    imports = [ inputs.self.modules.nixos.noctalia ];

    programs.mango.enable = true;
    security.polkit.enable = true;

    environment.systemPackages = [ pkgs.foot ];

    xdg.portal = {
      wlr = {
        enable = true;
        settings.screencast = {
          chooser_type = "simple";
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
        };
      };
      # nixpkgs spells this "ScreenShot"; the real interface is "Screenshot"
      config.mango."org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
    };

    home-manager.sharedModules = [ inputs.self.modules.homeManager.mango ];
  };

  flake.modules.homeManager.mango = { config, ... }: {
    xdg.configFile."mango/config.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${repoPath}/modules/features/mango/config.toml";
  };
}
