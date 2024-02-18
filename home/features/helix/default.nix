{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catpuccin_mocha";
      editor = {
        color-modes = true;
        line-number = "relative";
        indent-guides.render = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };
}
