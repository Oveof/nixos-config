# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, boot, environment, hardware, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      <nixos-hardware/lenovo/thinkpad/t14s>
      ./hardware-configuration.nix
      #<nixos/modules/hardware/video/displaylink.nix>
     # ./homemanager.nix
    ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  services.udev.packages = [ pkgs.platformio-core.udev ];
  services.udev.extraRules = ''
   KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    histSize = 10000;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
  # services.xserver.videoDrivers = [ "displaylink" "modesetting" ];
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;
  programs.kdeconnect.enable = true; 
  programs.wireshark.enable = true;
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.enable = true;
  # services.xserver.dpi = 156;
  programs.tmux = {
    enable = true;
    clock24 = true;
  };

  virtualisation.docker.enable = false;
  virtualisation.podman.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # xwayland.hidpi = true;
  };
  services.logind.extraConfig = ''
    HandlePowerKey=suspend
  '';
  
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  services.fwupd.enable = true;
  # Configure keymap in X11
  services.xserver = {
    layout = "no";
    xkbVariant = "nodeadkeys";
    resolutions = [{ x=1920; y=1200; }];
    virtualScreen = { x=1920;y=1200; };
  };
  # services.fprintd.enable = true;
  # services.fprintd.tod.enable = true;
  # services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;
   # Configure console keymap
  console.keyMap = "no";

  security.pam.services.swaylock.text = ''
    auth include login
  '';
  security.polkit.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];    
  xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.ove = {
    isNormalUser = true;
    description = "Ove";
    extraGroups = [ "networkmanager" "wheel" "docker" "vboxusers" "libvirtd" "wireshark"];
    packages = with pkgs; [];
  };
  services.ratbagd.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    git
    helix
    obsidian
    waybar
    bitwarden
    hyprpicker
    hyprpaper
    spotify
    kitty
    wl-clipboard
    dotnet-sdk_7
    dunst
    ranger
    rustc
    cargo 
    gcc
    lldb
    distrobox
    # networkmanagerapplet
    firefox
    rofi-wayland
    #Dependencies for waybar
    gtkmm3
    jsoncpp
    fmt
    wayland
    spdlog
    scdoc
    upower
    swaylock
    discord
    (pkgs.writeShellScriptBin "discord" ''
      exec ${pkgs.discord}/bin/discord --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto
    ''
    )
    grim
    slurp
    rust-analyzer
    rustup
    gnome.gnome-shell
    piper
    brightnessctl
    vscode
    python3
    python311
    python311Packages.pip
    python-launcher
    omnisharp-roslyn
    marksman
    zathura
    calibre
    wireshark
    wezterm
    docker-compose
    ];
  fonts.fonts = with pkgs; [
    font-awesome
    jetbrains-mono
  ];
  environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
  ]) ++ (with pkgs.gnome; [
  cheese # webcam tool
  gnome-music
  gnome-terminal
  gedit # text editor
  epiphany # web browser
  geary # email reader
  evince # document viewer
  gnome-characters
  totem # video player
  tali # poker game
  iagno # go game
  hitori # sudoku game
  atomix # puzzle game
  gnome-maps
  gnome-weather
  simple-scan
  gnome-contacts
]);
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
