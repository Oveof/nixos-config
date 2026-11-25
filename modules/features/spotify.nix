{
  flake.modules.nixos.spotify = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.spotify ];

    # Local discovery: Spotify Connect and syncing local files to mobile
    networking.firewall = {
      allowedTCPPorts = [ 57621 ];
      allowedUDPPorts = [ 5353 ];
    };
  };
}
