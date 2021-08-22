{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "JVictorV";
    userEmail = "joaovictorvisona@gmail.com";
    signing = {
      key = "944BEF702E6490B8";
      signByDefault = true;
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
