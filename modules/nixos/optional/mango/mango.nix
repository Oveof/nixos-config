{ ... }:
{
  imports = [
    ./dependencies.nix
    ./xdg-portals.nix
    ./env.nix
  ];
  programs.mango.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
