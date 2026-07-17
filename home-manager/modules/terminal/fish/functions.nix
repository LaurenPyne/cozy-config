_:

{
  programs.fish.functions = {

    # Cozy
    cfg = ''
      cd ~/cozy-config
      and git status
    '';

    rebuild = ''
      just pre-commit
      and just build
      and just switch
    '';

    update = ''
      nix flake update
      and just pre-commit
      and just build
    '';

    clean = ''
      nix store gc
      and nix-collect-garbage -d
    '';

    # Filesystem
    mkcd = ''
      mkdir -p $argv
      and cd $argv
    '';

    # Future

    # extract = ''
    #   # Extract any supported archive type
    # '';

    # weather = ''
    #   curl wttr.in
    # '';

    # ip = ''
    #   curl ifconfig.me
    # '';
  };
}
