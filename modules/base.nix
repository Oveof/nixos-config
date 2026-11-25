{ config, ... }:
let
  inherit (config.meta) username;
in
{
  flake.modules.nixos.base = { pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    time.timeZone = "Europe/Oslo";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "no";

    networking.networkmanager.enable = true;

    users.users.${username} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };

    environment.systemPackages = [ pkgs.git ];
  };

  flake.modules.homeManager.base = { pkgs, ... }: {
    programs.home-manager.enable = true;
    programs.git.enable = true;
  };
}
