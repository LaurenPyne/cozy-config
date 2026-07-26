{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixd
    nixfmt
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      userSettings = {
        # ---------------------------------------------------------------------
        # Appearance
        # ---------------------------------------------------------------------

        "workbench.colorTheme" = "Everforest Pro Dark Vibrant";
        "workbench.iconTheme" = "material-icon-theme";

        "workbench.startupEditor" = "none";
        "workbench.editor.enablePreview" = false;
        "workbench.layoutControl.enabled" = false;

        "window.commandCenter" = false;

        "breadcrumbs.enabled" = true;

        # ---------------------------------------------------------------------
        # Editor
        # ---------------------------------------------------------------------

        "editor.fontFamily" = "JetBrainsMono Nerd Font";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 14;
        "editor.lineHeight" = 24;

        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.renderWhitespace" = "boundary";
        "editor.stickyScroll.enabled" = true;
        "editor.inlineSuggest.enabled" = true;
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.smoothScrolling" = true;

        "editor.tabSize" = 4;

        "editor.bracketPairColorization.enabled" = true;
        "editor.guides.bracketPairs" = true;
        "editor.guides.highlightActiveBracketPair" = true;

        "editor.rulers" = [
          80
          100
        ];

        # ---------------------------------------------------------------------
        # Files
        # ---------------------------------------------------------------------

        "files.autoSave" = "onFocusChange";
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;

        # ---------------------------------------------------------------------
        # Explorer
        # ---------------------------------------------------------------------

        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;

        # ---------------------------------------------------------------------
        # Git
        # ---------------------------------------------------------------------

        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;

        # ---------------------------------------------------------------------
        # Terminal
        # ---------------------------------------------------------------------

        "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";

        "terminal.integrated.initialHint" = false;
        "terminal.integrated.scrollback" = 100000;

        "terminal.integrated.profiles.linux" = {
          fish = {
            path = "fish";
          };
        };

        "terminal.integrated.defaultProfile.linux" = "fish";

        # ---------------------------------------------------------------------
        # Nix
        # ---------------------------------------------------------------------

        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";

        # ---------------------------------------------------------------------
        # Rust
        # ---------------------------------------------------------------------

        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };

        "rust-analyzer.check.command" = "clippy";
        "rust-analyzer.cargo.features" = "all";

        "rust-analyzer.inlayHints.typeHints.enable" = true;
        "rust-analyzer.inlayHints.parameterHints.enable" = true;

        # ---------------------------------------------------------------------
        # Lua
        # ---------------------------------------------------------------------

        "[lua]" = {
          "editor.defaultFormatter" = "sumneko.lua";
        };

        "Lua.format.enable" = true;
        "Lua.hint.enable" = true;
        "Lua.runtime.version" = "Lua 5.4";

        # ---------------------------------------------------------------------
        # Python
        # ---------------------------------------------------------------------

        "[python]" = {
          "editor.defaultFormatter" = "charliermarsh.ruff";
          "editor.formatOnSave" = true;
        };

        "python.analysis.typeCheckingMode" = "basic";
        "python.analysis.autoImportCompletions" = true;
        "python.analysis.autoSearchPaths" = true;
        "python.analysis.completeFunctionParens" = true;
        "python.analysis.diagnosticMode" = "workspace";

        "python.languageServer" = "Pylance";

        "python.terminal.activateEnvironment" = true;
        "python.createEnvironment.trigger" = "off";

        "python.testing.pytestEnabled" = true;
        "python.testing.unittestEnabled" = false;

        "python.experiments.enabled" = false;

        "ruff.nativeServer" = "on";
        "ruff.importStrategy" = "fromEnvironment";

        "isort.importStrategy" = "fromEnvironment";
      };

      extensions = with pkgs.vscode-extensions; [
        # -----------------------------------------------------------------
        # Theme
        # -----------------------------------------------------------------

        pkief.material-icon-theme

        # -----------------------------------------------------------------
        # Nix
        # -----------------------------------------------------------------

        jnoortheen.nix-ide

        # -----------------------------------------------------------------
        # Git
        # -----------------------------------------------------------------

        eamodio.gitlens
        github.vscode-pull-request-github

        # -----------------------------------------------------------------
        # Remote
        # -----------------------------------------------------------------

        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit

        # -----------------------------------------------------------------
        # Development
        # -----------------------------------------------------------------

        mkhl.direnv
        ritwickdey.liveserver

        # -----------------------------------------------------------------
        # Fish
        # -----------------------------------------------------------------

        bmalehorn.vscode-fish
        ndonfris.fish-lsp

        # -----------------------------------------------------------------
        # Rust
        # -----------------------------------------------------------------

        rust-lang.rust-analyzer
        vadimcn.vscode-lldb

        # -----------------------------------------------------------------
        # Lua
        # -----------------------------------------------------------------

        sumneko.lua
        pollywoggames.pico8-ls
        tomblind.local-lua-debugger-vscode

        # -----------------------------------------------------------------
        # Python
        # -----------------------------------------------------------------

        ms-python.python
        ms-python.vscode-pylance
        ms-python.debugpy
        ms-python.isort
        charliermarsh.ruff
      ];
    };
  };
}
