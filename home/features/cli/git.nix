{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Oveof";
    userEmail = "31305976+Oveof@users.noreply.github.com";
     # Automatically track remote branch
      push.autoSetupRemote = true;
    };
    lfs.enable = true;
}

