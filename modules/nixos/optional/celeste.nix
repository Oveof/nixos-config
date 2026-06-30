{ pkgs }:
{
  environment.systemPackages = with pkgs; [
    olympus
    mangohud
  ];
}
