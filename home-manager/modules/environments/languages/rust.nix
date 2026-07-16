{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # rustup manages the active toolchain (stable/nightly).

    rustup
    rustlings

    cargo-binstall
    cargo-edit
    cargo-nextest
    cargo-watch

    bacon
  ];
}
