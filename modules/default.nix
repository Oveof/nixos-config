{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprland;

in {
    options.modules.hyprland= { enable = mkEnableOption "hyprland"; };
    config = mkIf cfg.enable {
	  home.packages = with pkgs; [
	    wofi swaybg wlsunset wl-clipboard hyprland
	];

        home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
        home.file.".config/hypr/monitors.conf".source = ./monitors.conf;
        home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
        home.file.".config/hypr/mocha.conf".source = ./mocha.conf;
        home.file.".config/hypr/startup.conf".source = ./startup.conf;
        home.file.".config/hypr/kbm.conf".source = ./kbm.conf;
        home.file.".config/hypr/bindings.conf".source = ./bindings.conf;
        home.file.".config/hypr/styling.conf".source = ./styling.conf;
    };
}
