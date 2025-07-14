{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "ovedy@oftedal.com";
        name = "Ove Oftedal";
      };
      ui = {
        paginate = "never";
        editor = "nvim";
      };
    };
  };
}
