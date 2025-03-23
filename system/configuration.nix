
{ pkgs, ... }:

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
    ./virtualisation.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 1;
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

  programs.adb.enable = true;
  users.users.swhit.extraGroups = ["adbuser"];

  services = {
      # Network shares
      samba = {
        package = pkgs.samba4Full;
        # ^^ `samba4Full` is compiled with avahi, ldap, AD etc support (compared to the default package, `samba`
        # Required for samba to register mDNS records for auto discovery 
        # See https://github.com/NixOS/nixpkgs/blob/592047fc9e4f7b74a4dc85d1b9f5243dfe4899e3/pkgs/top-level/all-packages.nix#L27268
        enable = true;
        openFirewall = true;
        shares.Movies = {
          path = "/bullshit/Videos/Movies/";
          writable = "true";
          comment = "Hello World!";
        };
      };
      avahi = {
        publish.enable = true;
        publish.userServices = true;
        # ^^ Needed to allow samba to automatically register mDNS records (without the need for an `extraServiceFile`
        nssmdns4 = true;
        # ^^ Not one hundred percent sure if this is needed- if it aint broke, don't fix it
	enable = true;
        openFirewall = true;
      };
      samba-wsdd = {
      # This enables autodiscovery on windows since SMB1 (and thus netbios) support was discontinued
        enable = true;
        openFirewall = true;
      };
    };

  system.stateVersion = "24.11"; # Change me! Please!
}

