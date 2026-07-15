_:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      rebuild = "just rebuild";
    };
  };
}
