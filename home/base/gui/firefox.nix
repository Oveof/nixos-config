{
  programs.firefox = {
    enable = true;
    profiles.default.userChrome = ''
      /* hides the native tabs */
        #TabsToolbar {
          visibility: collapse;
        }
    '';
  };
}
