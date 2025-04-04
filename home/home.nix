{ pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./hyprland.nix
    ./waybar.nix
    ./zsh.nix
    ./ghostty.nix
    ./nixvim.nix
    ./git.nix
    ./obs.nix
    ./stylix.nix
    ./firefox.nix
  ];
  home.username = "swhit";
  home.homeDirectory = "/home/swhit";
  home.stateVersion = "24.11";
  
# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
  home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
  };

# Home Manager can also manage your environment variables through 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/swhit/etc/profile.d/hm-session-vars.sh
#
  home.sessionVariables = {

  };
  
  i18n.inputMethod = {
     enabled = "fcitx5";
     fcitx5.addons = with pkgs; [
       fcitx5-gtk             # alternatively, kdePackages.fcitx5-qt
       fcitx5-nord            # a color theme
     ];
   };

  programs.home-manager.enable = true;
}
