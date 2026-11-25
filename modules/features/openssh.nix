{ config, ... }:
let
    inherit (config.meta) username;
in
{
    flake.modules.nixos.openssh = {
        services.openssh = {
            enable = true;
	};
    };
}
