{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # File utilities
    bat
    eza
    fd
    tree

    # Search
    ripgrep
    fzf

    # JSON
    jq

    # Monitoring
    btop
  ];
}
