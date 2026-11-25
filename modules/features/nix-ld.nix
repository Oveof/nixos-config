{
  flake.modules.nixos.nix-ld = { pkgs, ... }: {
    programs.nix-ld = {
      enable = true;
      # Added on top of nix-ld's defaults (glibc, zlib, openssl, curl, ...)
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        icu
        libGL
        libxkbcommon
        wayland
        fontconfig
        freetype
        glib
        dbus
        alsa-lib
        libpulseaudio
      ];
    };
  };
}
