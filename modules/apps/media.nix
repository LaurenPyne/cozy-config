{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    mov-cli
  ];
}
