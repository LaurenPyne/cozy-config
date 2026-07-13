{ pkgs, ... }:

{
  home.packages = with pkgs; [
    just

    fd
    ripgrep
    jq
    tree

    zip
    unzip

    curl
    wget

    btop
    dust
    duf
  ];

  programs.bat.enable = true;

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
}
