{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python3

    # Package management
    uv

    # Formatting & linting
    ruff

    # Language server
    basedpyright

    # Interactive shell
    python313Packages.ipython
  ];
}
