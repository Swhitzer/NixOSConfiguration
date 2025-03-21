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
      homeUpdate = "home-manager switch --impure --flake ~/nix/";
      zapret = "sudo /opt/zapret/init.d/sysv/zapret start";
    };
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromTOML (builtins.unsafeDiscardStringContext (builtins.readFile ./myTheme.toml));
  };
}
