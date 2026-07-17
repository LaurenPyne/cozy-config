{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixd
    nixfmt
  ];

  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        # Appearance
        "workbench.colorTheme" = "Everforest Pro Dark Vibrant";
        "workbench.startupEditor" = "none";
        "workbench.editor.enablePreview" = false;

        # Editor
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.renderWhitespace" = "boundary";
        "editor.stickyScroll.enabled" = true;
        "editor.inlineSuggest.enabled" = true;
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.smoothScrolling" = true;
        "editor.tabSize" = 2;
        "editor.rulers" = [
          80
          100
        ];

        # Files
        "files.autoSave" = "onFocusChange";
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;

        # Explorer
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;

        # Git
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;

        # Terminal
        "terminal.integrated.initialHint" = false;
        "terminal.integrated.scrollback" = 100000;
        "terminal.integrated.defaultProfile.linux" = "fish";

        # Nix
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";

        # Rust
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };

        "rust-analyzer.check.command" = "clippy";
        "rust-analyzer.cargo.features" = "all";
        "rust-analyzer.inlayHints.typeHints.enable" = true;
        "rust-analyzer.inlayHints.parameterHints.enable" = true;

        # Lua
        "[lua]" = {
          "editor.defaultFormatter" = "sumneko.lua";
        };

        "Lua.format.enable" = true;
        "Lua.hint.enable" = true;
        "Lua.runtime.version" = "Lua 5.4";
      };
      extensions = with pkgs.vscode-extensions; [
        # Core Development
        jnoortheen.nix-ide
        mkhl.direnv

        eamodio.gitlens
        github.vscode-pull-request-github

        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit

        ritwickdey.liveserver

        # Fish
        bmalehorn.vscode-fish
        ndonfris.fish-lsp

        # Rust
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb

        # Lua
        sumneko.lua
        pollywoggames.pico8-ls
        tomblind.local-lua-debugger-vscode

        # Python
        # Reserved for future additions
      ];
    };
  };
}
