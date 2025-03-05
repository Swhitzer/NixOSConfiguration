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
    #settings = {
    #  "$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";
    #  final_space = true;
    #  version = 3;

    #  blocks = {
    #    type = "prompt";
    #    alignment = "left";
    #    
    #    segments = [
    #      {
    #        type = "path";
    #        style = "powerline";
    #        powerline_symbol = "\uE0B0";
    #        foreground = "#ffffff";
    #        background = "#61AFEF";
    #        propertires = {
    #          style = "folder";
    #        };
    #      }
    #    ];
    #  };
    #};
  };
}
