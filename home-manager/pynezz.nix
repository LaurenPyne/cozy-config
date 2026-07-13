{ ... }:

{
  imports = [
    ./modules
  ];

  home.username = "pynezz";
  home.homeDirectory = "/home/pynezz";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
