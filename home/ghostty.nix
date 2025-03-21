{ ... }:

{
  programs.ghostty = {
    enable = true;

    enableZshIntegration = true;
    settings = {
      background-opacity = 0.8;

      confirm-close-surface = false;

    };
  };

  stylix.targets.ghostty.enable = true;
}
