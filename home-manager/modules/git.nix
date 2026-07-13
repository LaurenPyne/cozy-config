{ ... }:

{
  programs.git = {
    enable = true;

    userName = "pynezz";
    userEmail = "CHANGE_ME";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
