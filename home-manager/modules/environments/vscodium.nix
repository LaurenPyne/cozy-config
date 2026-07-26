{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixd
    nixfmt
  ];

  programs.vscodium = {
    enable = true;

    profiles.default = {
      userSettings = {
        # ================================================================
        # Appearance
        # ================================================================

        "workbench.colorTheme" = "Everforest Pro Dark Vibrant";
        "workbench.iconTheme" = "material-icon-theme";

        "workbench.startupEditor" = "none";
        "workbench.editor.enablePreview" = false;
        "workbench.layoutControl.enabled" = false;

        "window.commandCenter" = false;
        "window.restoreWindows" = "all";

        "breadcrumbs.enabled" = true;

        # ================================================================
        # Editor
        # ================================================================

        "editor.fontFamily" = "JetBrainsMono Nerd Font";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 14;
        "editor.lineHeight" = 24;

        "editor.tabSize" = 4;

        "editor.formatOnSave" = true;

        "editor.minimap.enabled" = false;
        "editor.renderWhitespace" = "boundary";
        "editor.stickyScroll.enabled" = true;
        "editor.inlineSuggest.enabled" = true;

        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.smoothScrolling" = true;

        "editor.bracketPairColorization.enabled" = true;
        "editor.guides.bracketPairs" = true;
        "editor.guides.highlightActiveBracketPair" = true;

        "editor.rulers" = [
          80
          100
        ];

        # ================================================================
        # Files
        # ================================================================

        "files.autoSave" = "onFocusChange";
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;

        "files.exclude" = {
          "**/.ruff_cache" = true;
          "**/.pytest_cache" = true;
          "**/.mypy_cache" = true;
          "**/__pycache__" = true;
          "**/.DS_Store" = true;
        };

        "files.watcherExclude" = {
          "**/.ruff_cache/**" = true;
          "**/.pytest_cache/**" = true;
          "**/.mypy_cache/**" = true;
          "**/__pycache__/**" = true;

          "**/.git/objects/**" = true;
          "**/.git/subtree-cache/**" = true;
        };

        # ================================================================
        # Workspace
        # ================================================================

        "workbench.tips.enabled" = false;

        "workbench.editor.labelFormat" = "short";

        "workbench.editor.tabSizing" = "shrink";

        "workbench.editor.limit.enabled" = true;
        "workbench.editor.limit.value" = 15;

        "update.mode" = "manual";

        # ================================================================
        # Explorer
        # ================================================================

        "workbench.tree.indent" = 16;

        "explorer.compactFolders" = false;
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.sortOrder" = "default";

        "explorer.fileNesting.enabled" = true;

        "explorer.fileNesting.patterns" = {
          "flake.nix" = "flake.lock";
          "Cargo.toml" = "Cargo.lock";
          "package.json" = "package-lock.json,yarn.lock,pnpm-lock.yaml";
          "pyproject.toml" = "uv.lock,poetry.lock";
        };

        # ================================================================
        # Search
        # ================================================================

        "search.smartCase" = true;
        "search.useIgnoreFiles" = true;
        "search.followSymlinks" = false;

        "search.exclude" = {
          "**/.ruff_cache" = true;
          "**/.pytest_cache" = true;
          "**/.mypy_cache" = true;
          "**/__pycache__" = true;
        };

        # ================================================================
        # Git
        # ================================================================

        "git.autofetch" = true;

        "git.enableSmartCommit" = true;

        "git.confirmSync" = false;

        "git.autoRepositoryDetection" = "openEditors";

        "git.openRepositoryInParentFolders" = "always";

        "git.inputValidation" = "always";

        "git.blame.editorDecoration.enabled" = true;

        "git.decorations.enabled" = true;

        "git.showInlineOpenFileAction" = true;

        # ================================================================
        # Terminal
        # ================================================================

        "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";

        "terminal.integrated.initialHint" = false;
        "terminal.integrated.scrollback" = 100000;

        "terminal.integrated.copyOnSelection" = true;
        "terminal.integrated.cursorBlinking" = true;

        "terminal.integrated.profiles.linux" = {
          fish = {
            path = "fish";
          };
        };

        "terminal.integrated.defaultProfile.linux" = "fish";

        # ================================================================
        # Nix
        # ================================================================

        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";

        "nix.serverSettings" = {
          nixd = {
            formatting.command = [ "nixfmt" ];
          };
        };

        # ================================================================
        # Rust
        # ================================================================

        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };

        "rust-analyzer.check.command" = "clippy";
        "rust-analyzer.checkOnSave" = true;

        "rust-analyzer.cargo.features" = "all";
        "rust-analyzer.cargo.buildScripts.enable" = true;

        "rust-analyzer.procMacro.enable" = true;

        "rust-analyzer.inlayHints.typeHints.enable" = true;
        "rust-analyzer.inlayHints.parameterHints.enable" = true;

        # ================================================================
        # Lua
        # ================================================================

        "[lua]" = {
          "editor.defaultFormatter" = "sumneko.lua";
        };

        "Lua.runtime.version" = "Lua 5.4";
        "Lua.format.enable" = true;
        "Lua.hint.enable" = true;

        # ================================================================
        # Python
        # ================================================================

        "[python]" = {
          "editor.defaultFormatter" = "charliermarsh.ruff";
          "editor.formatOnSave" = true;
        };

        "python.languageServer" = "Pylance";
        "python.defaultInterpreterPath" = "python";

        "python.analysis.typeCheckingMode" = "basic";
        "python.analysis.autoImportCompletions" = true;
        "python.analysis.autoSearchPaths" = true;
        "python.analysis.completeFunctionParens" = true;
        "python.analysis.diagnosticMode" = "workspace";

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
        # ================================================================
        # Theme
        # ================================================================

        pkief.material-icon-theme

        # ================================================================
        # Nix
        # ================================================================

        jnoortheen.nix-ide

        # ================================================================
        # Git
        # ================================================================

        eamodio.gitlens
        github.vscode-pull-request-github
        usernamehw.errorlens
        # ================================================================
        # Remote Development
        # ================================================================

        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit

        # ================================================================
        # General Development
        # ================================================================

        mkhl.direnv
        ritwickdey.liveserver

        # ================================================================
        # Fish
        # ================================================================

        bmalehorn.vscode-fish
        ndonfris.fish-lsp

        # ================================================================
        # Rust
        # ================================================================

        rust-lang.rust-analyzer
        vadimcn.vscode-lldb

        # ================================================================
        # Lua / PICO-8
        # ================================================================

        sumneko.lua
        pollywoggames.pico8-ls
        tomblind.local-lua-debugger-vscode

        # ================================================================
        # Python
        # ================================================================

        ms-python.python
        ms-python.vscode-pylance
        ms-python.debugpy

        ms-python.isort
        charliermarsh.ruff
      ];
    };
  };
}
