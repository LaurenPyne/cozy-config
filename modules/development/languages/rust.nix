{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup

    cargo-edit
    cargo-watch
    cargo-nextest
    cargo-binstall
    bacon
    rustlings
  ];
}
