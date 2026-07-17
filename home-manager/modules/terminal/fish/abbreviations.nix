_:

{
  programs.fish.shellAbbrs = {
    # Git
    g = "git";
    ga = "git add";
    gaa = "git add .";
    gc = "git commit";
    gp = "git push";
    gs = "git status";
    gd = "git diff";
    gl = "git log --oneline --graph --decorate";

    # Just
    j = "just";
    jb = "just build";
    js = "just switch";
    jp = "just pre-commit";
    jr = "just rebuild";

    # Nix
    ns = "nix search nixpkgs";
    nf = "nix flake";
    nfu = "nix flake update";

    # Cozy
    cfg = "cd ~/cozy-config";
  };
}
