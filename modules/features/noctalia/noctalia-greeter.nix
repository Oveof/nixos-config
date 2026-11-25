{
  flake.modules.nixos.noctalia-greeter = {
    services.displayManager.noctalia-greeter.enable = true;
    services.greetd.enable = true;
  };
}
