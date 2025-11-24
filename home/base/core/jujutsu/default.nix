{
  pkgs,
  ...
}:
{
  programs.jujutsu = {
    enable = true;
    # settings = {
    #   user = {
    #     email = "ovedy@oftedal.com";
    #     name = "Ove Oftedal";
    #   };
    #   ui = {
    #     paginate = "never";
    #     editor = "nvim";
    #     default-command = "log";
    #     diff-editor = ["nvim" "-c" "DiffEditor $left $right $output"];
    #   };
    # };
  };
  home.file.".config/jj" = {
    source = ./config;
    recursive = true; # link recursively
    executable = true; # make all files executable
  };
  home.packages = [ pkgs.lazyjj ];
}
