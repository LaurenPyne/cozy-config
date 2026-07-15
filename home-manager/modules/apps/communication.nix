{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    thunderbird
    zoom-us
  ];
}
