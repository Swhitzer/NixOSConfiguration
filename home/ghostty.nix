{ ... }:

{
  programs.ghostty = {
    enable = true;

    enableZshIntegration = true;
    settings = {
      theme = "/home/swhit/.cache/wal/colors-ghostty.conf";
      background-opacity = 0.8;

      confirm-close-surface = false;
    };
  };
}
