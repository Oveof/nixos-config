{ pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
      daemon.settings = {
        # enables pulling using containerd, which supports restarting from a partial pull
        # https://docs.docker.com/storage/containerd/
        "features" = {
          "containerd-snapshotter" = true;
        };
        bip = "172.28.0.1/16";
        "default-address-pools" = [
          {
            base = "172.29.0.0/16";
            size = 24;
          }
          {
            base = "172.30.0.0/16";
            size = 24;
          }
          {
            base = "172.31.0.0/16";
            size = 24;
          }
        ];
      };

      # start dockerd on boot.
      # This is required for containers which are created with the `--restart=always` flag to work.
      enableOnBoot = true;
    };
    podman.enable = false;

    # Usage: https://wiki.nixos.org/wiki/Waydroid
    # waydroid.enable = true;

    libvirtd = {
      enable = true;
      # hanging this option to false may cause file permission issues for existing guests.
      # To fix these, manually change ownership of affected files in /var/lib/libvirt/qemu to qemu-libvirtd.
      qemu.runAsRoot = true;
    };

    # lxd.enable = true;
  };
  environment.systemPackages = with pkgs; [
    distrobox
    virt-manager
  ];
}
