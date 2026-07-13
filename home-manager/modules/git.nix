{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "LaurenPyne";
        email = "lauren.pyne@proton.me";
      };

      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
