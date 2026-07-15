{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        "workbench.colorTheme" = "Everforest Pro Dark Vibrant";
        "terminal.integrated.initialHint" = false;

        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
          "editor.formatOnSave" = true;
        };

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        mkhl.direnv
      ];
    };
  };
}
