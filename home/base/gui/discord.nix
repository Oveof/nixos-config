{ pkgs, lib, ... }:
let
  pnpm-fixed = pkgs.pnpm_10_29_2.overrideAttrs (old: rec {
    version = "10.34.4";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/pnpm/-/pnpm-${version}.tgz";
      hash = "sha512-h2i+VSAK4/Iia2Un/Momh+FLxOXxLXchoPJdo99HkVF3BYZI20F3uvNIEg+guidS2NjZP2vq8f5krhjajelhrw==";
    };
    meta = old.meta // {
      knownVulnerabilities = [ ];
    };
  });

  vesktop-fixed = pkgs.vesktop.override {
    pnpm_10_29_2 = pnpm-fixed;
  };
in
{
  home.packages = [
    vesktop-fixed
    pkgs.discord
  ];
}
