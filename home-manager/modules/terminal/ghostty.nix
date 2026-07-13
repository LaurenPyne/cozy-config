{ ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      command = "fish";

      font-family = "JetBrainsMono Nerd Font";

      font-size = 13;

      window-padding-x = 10;
      window-padding-y = 10;

      confirm-close-surface = false;

      clipboard-read = "allow";
      clipboard-write = "allow";
    };
  };
}
