
{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  networking = {
    hostName = "swhit";

    interfaces = {
      enp2s0 = {
	useDHCP = true;
      };
    };

    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Astrakhan";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };


#########################
#    FUCKING AUDIO      #
#########################

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.pulseaudio.enable = lib.mkForce false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber = {
      enable = true;
      package = pkgs.wireplumber;
    };
  };
  


  virtualisation.virtualbox = {
    host.enable = true;
    guest = {
      enable = true;
      dragAndDrop = true;
    };
  };
  users.extraGroups.vboxusers.members = [ "swhit" ];



  users.users.swhit = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input"];
      shell = pkgs.zsh;
  };

  programs.hyprland.enable = true;
  programs.zsh.enable = true;


  environment.systemPackages = with pkgs; [
    home-manager
      git
      wget
      curl
      ghostty
      libnetfilter_queue
      iptables
      ipset
      auto-cpufreq
      unrar
      unzip
      ntfs3g
  ];

#########################
#  FUCKING SERVICES     #
#########################

  services.auto-cpufreq.enable = true;
  services.libinput.enable = true;

#Open ports in the firewall.
#networking.firewall.allowedTCPPorts = [ ... ];
#networking.firewall.allowedUDPPorts = [ ... ];
#Or disable the firewall altogether.
#networking.firewall.enable = false;

  system.stateVersion = "24.11"; # Change me! Please!
}

