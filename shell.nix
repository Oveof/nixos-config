# save this as shell.nix
{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  packages = [ pkgs.nil pkgs.lua-language-server ];
}
