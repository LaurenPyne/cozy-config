_:

{
  programs.fish.functions = {
    rebuild = ''
      just pre-commit
      and just build
      and just switch
    '';
  };
}
