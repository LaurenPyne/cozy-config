{ pkgs, ... }:

{
  home.packages = with pkgs; [
    just
    eza
    bat
    fd
    ripgrep
    jq
    tree
    unzip
    zip
    curl
    wget
    btop
    dust
    duf

    statix
    deadnix
    treefmt
  ];
}
