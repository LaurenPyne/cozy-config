{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = true;

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };

      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
        read_only = " ";
      };

      git_branch = {
        symbol = " ";
      };

      git_status = {
        disabled = false;

        ahead = "⇡";
        behind = "⇣";
        diverged = "⇕";

        modified = "!";
        staged = "+";
        untracked = "?";
        deleted = "✘";
        renamed = "»";
      };

      cmd_duration = {
        min_time = 2000;
        format = "took [$duration]($style)";
      };

      rust = {
        symbol = "🦀 ";
      };

      python = {
        symbol = "🐍 ";
      };

      lua = {
        symbol = "🌙 ";
      };

      nix_shell = {
        symbol = "❄ ";
        format = "[$symbol$state]($style) ";
      };
    };
  };
}
