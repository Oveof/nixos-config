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
      bind h display-popup -E "tms"
      bind n select-window -t 1
      bind e select-window -t 2
      bind i select-window -t 3
      bind o select-window -t 4
      unbind C-b
      set-option -g prefix C-a
      set-window-option -g mode-keys vi
    '';
  };
}
