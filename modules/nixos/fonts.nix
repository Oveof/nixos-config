{pkgs, ...}:
{
  fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;

    packages = with pkgs; [
      font-awesome
      nerd-fonts.fira-code
      meslo-lg
      jetbrains-mono
    ];
    fontconfig.defaultFonts = {
      serif = ["FiraCode Nerd Font"];
      sansSerif = ["FiraCode Nerd Font"];
      monospace = ["FiraMono Nerd Font"];
    };
  };
}
