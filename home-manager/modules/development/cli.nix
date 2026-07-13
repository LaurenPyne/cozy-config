{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Task runner
    just

    # Better core utilities
    eza
    bat
    fd
    ripgrep

    # Useful utilities
    jq
    tree
    unzip
    zip
    curl
    wget

    # System monitoring
    btop
    dust
    duf
  ];
}
