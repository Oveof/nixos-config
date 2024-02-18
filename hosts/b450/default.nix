{ inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    # ../common/users/ove

    # ../common/optional/pipewire.nix
    # ../common/optional/quietboot.nix
  ];

  networking = {
    hostName = "atlas";
    useDHCP = true;
  };

  # boot = {
  #   kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  #   binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  # };

  programs = {
    # adb.enable = true;
    # dconf.enable = true;
    kdeconnect.enable = true;
  };

  services.hardware.openrgb.enable = true;
  hardware = {
    opengl.enable = true;
    # opentabletdriver.enable = true;
  };

  system.stateVersion = "22.05";
}
