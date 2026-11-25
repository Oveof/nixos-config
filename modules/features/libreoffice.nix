{
  flake.modules.nixos.libreoffice = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libreoffice-fresh
      hunspell
      hunspellDicts.nb_NO
      hunspellDicts.nn_NO
      hunspellDicts.en_US
    ];
  };
}
