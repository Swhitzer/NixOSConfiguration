
{ pkgs, ...}:

{
#########################
#   FUCKING PACKAGES    #
#########################

  environment.systemPackages = with pkgs; [
    home-manager
      git
      wget
      curl
      auto-cpufreq
      zapret
      unrar
      unzip
      ntfs3g
      exfat
      ipset
      iptables
  ];
}
