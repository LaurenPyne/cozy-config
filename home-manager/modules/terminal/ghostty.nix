_:

{
  programs.ghostty = {
    enable = true;

    settings = {

      # Shell
      command = "fish";

      # Typography
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;

      # Cursor
      cursor-style = "block";

      # Window
      window-padding-x = 10;
      window-padding-y = 10;

      window-save-state = true;

      # Scrollback
      scrollback-limit = 100000;

      # Clipboard
      clipboard-read = "allow";
      clipboard-write = "allow";

      # Behaviour
      confirm-close-surface = false;
    };
  };
}
