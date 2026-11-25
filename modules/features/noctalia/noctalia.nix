{ config, ... }:
let
  inherit (config.meta) username;
in
{
  flake.modules.nixos.noctalia = { pkgs, ... }: {
    programs.noctalia = {
      enable = true;
      # NetworkManager, bluetooth, UPower, power-profiles-daemon
      recommendedServices.enable = true;
    };

    # Brightness on external monitors over DDC/CI
    users.users.${username}.extraGroups = [ "i2c" ];
    environment.systemPackages = [ pkgs.ddcutil ];
  };
}
