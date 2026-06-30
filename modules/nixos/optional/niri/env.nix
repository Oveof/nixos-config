{ ... }:
{
  environment.variables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "gnome";
    XDG_SESSION_DESKTOP = "niri";
    MOZ_ENABLE_WAYLAND = "1";
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
  };
}
