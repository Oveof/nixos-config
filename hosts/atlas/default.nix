# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, nixos-hardware, username,... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/base.nix
      ../../modules/nixos/server

    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  console.keyMap = "no";

  networking.hostName = "atlas"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  services.openssh.enable = true;
  networking = {
    interfaces.enp0s31f6 = {
      ipv4.addresses = [{
        address = "192.168.11.40";
        prefixLength = 24;
      }];
    };
    defaultGateway = {
      address = "192.168.11.1";
      interface = "enp0s31f6";
    };
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
