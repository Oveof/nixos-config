{
  config,
  pkgs,
  # fetchFromGitHub,
  ...
}:
let
  tmux-grimoire = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-grimoire";
    version = "1.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "navahas";
      repo = "tmux-grimoire";
      rev = "94b3f0087289ec5cbeb9cc225ab665661d55123c";
      sha256 = "sha256-oLtOO0vclwwVLYnWCY0nG+QGAdYik6L04eR606IHnW0=";
    };
    rtpFilePath = "grimoire.tmux";
  };
in
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
      pkgs.tmuxPlugins.yank
      tmux-grimoire
      pkgs.tmuxPlugins.tmux-floax
      # needs python3 for some reason so idk
      # pkgs.tmuxPlugins.tmux-which-key
    ];
    extraConfig = ''
      set -g base-index 1
      setw -g pane-base-index 1
      bind h display-popup -E "tms"
      bind n select-window -t 1
      bind e select-window -t 2
      bind i select-window -t 3
      bind o select-window -t 4
      bind l select-window -t 5
      bind u select-window -t 6
      bind y select-window -t 7
      unbind C-b
      set-option -g prefix C-s
      set-window-option -g mode-keys vi
      bind C-o display-popup -E "tms"

      bind-key -T prefix t run-shell "custom_shpell ephemeral taskwarrior '$HOME/.config/grimoire/shpells/popup-scratch.sh'"
      set -g @shpell-taskwarrior-color '#e3716e'
      set -g @shpell-taskwarrior-position 'center'
      set -g @shpell-taskwarrior-width '80%'
      set -g @shpell-taskwarrior-height '90%'
    '';

  };
}
