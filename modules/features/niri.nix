{ inputs, ... }:
{
  flake.modules.nixos.compositor = { pkgs, ... }: {
    imports = [ inputs.self.modules.nixos.terminal ];

    programs.niri.enable = true;
    xdg.portal.enable = true;
    security.polkit.enable = true;

    services.greetd = {
      enable = true;
      settings.default_session.command =
        "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
    };

    home-manager.sharedModules = [ inputs.self.modules.homeManager.compositor ];
  };

  flake.modules.homeManager.compositor = { pkgs, ... }: {
    programs.waybar.enable = true;
    programs.fuzzel.enable = true;
    services.mako.enable = true;
    home.packages = [ pkgs.wl-clipboard ];
  };
}
