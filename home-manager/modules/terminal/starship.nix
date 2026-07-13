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

      directory.truncation_length = 3;

      git_branch.symbol = " ";

      git_status.disabled = false;

      rust.symbol = " ";

      python.symbol = " ";

      lua.symbol = " ";

      nix_shell.symbol = "❄ ";
    };
  };
}
