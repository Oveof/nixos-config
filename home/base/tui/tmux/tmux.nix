{pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    # shortcut = "space";
    plugins = [ 
      pkgs.tmuxPlugins.sensible
      pkgs.tmuxPlugins.gruvbox
      pkgs.tmuxPlugins.jump
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
    ];
    extraConfig = ''
      set -g base-index 1
      setw -g pane-base-index 1
      bind o display-popup -E "tms"
      unbind C-b
      set-option -g prefix C-a
      set-window-option -g mode-keys vi
    '';
  };
}
