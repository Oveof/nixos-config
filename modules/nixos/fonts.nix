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
  };
}
