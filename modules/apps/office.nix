{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vlc
    mov-cli
  ];
}
