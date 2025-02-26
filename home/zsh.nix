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
      homeUpgrade = "home-manager switch --upgrade --flake ~/nix/";
      zapret = "sudo /opt/zapret/init.d/sysv/zapret start";
      chwal = "(){ wal -i $1 & hyprctl hyprpaper reload ,$1 && systemctl --user restart waybar;}";
    };
  };
}
