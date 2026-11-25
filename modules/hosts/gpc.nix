{ inputs, config, ... }:
let
  inherit (config.meta) username;
in
{
  flake.nixosConfigurations.gpc = inputs.nixpkgs.lib.nixosSystem {
    modules = with inputs.self.modules.nixos; [
      ./_hardware.nix
      base
      home-manager
      mango # Compositor
      noctalia # Shell
      noctalia-greeter # Greeter
      firefox
      thunderbird
      libreoffice
      spotify
      openssh
      neovim
      teams
      jujutsu
      nix-ld
      starship
      spotify
      atuin

      {
        networking.hostName = "gpc";
        nixpkgs.hostPlatform = "x86_64-linux";
        system.stateVersion = "25.11";
        home-manager.users.${username}.home.stateVersion = "25.11";
      }
    ];
  };
}
