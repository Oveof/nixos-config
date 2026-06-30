{ username, ... }:
{
  services.greetd = {
    enable = true;
    settings.default_session = {
      user = username;
      command = "niri-session";
    };
  };

}
