{ pkgs, ... }:
{
  home.packages = [ pkgs.obsidian ];

  xdg.configFile."discord/settings.json".text = ''
    {
      "SKIP_HOST_UPDATE": true
    }
  '';
}
