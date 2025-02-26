
{ ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./audio.nix
    ./users.nix
    ./services.nix
    ./network.nix
    ./packages.nix
    ./graphics.nix
    ./bluetooth.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; 

  time.timeZone = "Europe/Astrakhan";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  programs.zsh.enable = true;
  programs.hyprland.enable = true;

  system.stateVersion = "24.11"; # Change me! Please!
}

