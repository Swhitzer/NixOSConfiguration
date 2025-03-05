{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      systemUpdate = "sudo nixos-rebuild switch --flake ~/nix/";
      systemUpgrade = "sudo nixos-rebuild switch --upgrade --flake ~/nix/";
      homeUpdate = "home-manager switch --flake ~/nix/";
      zapret = "sudo /opt/zapret/init.d/sysv/zapret start";
      chwal = "(){ wal -i $1 && hyprctl hyprpaper reload ,$1 && systemctl --user restart waybar & cp $1 ~/.cache/current-wallpaper.jpg ;}";
    };
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromTOML (builtins.unsafeDiscardStringContext (builtins.readFile ./myTheme.toml));
  };
}
