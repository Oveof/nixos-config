{
  ...
}:
{
  imports = [
    ./dependencies.nix
    ./xdg-portals.nix
    ./env.nix
  ];

  programs.niri.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
