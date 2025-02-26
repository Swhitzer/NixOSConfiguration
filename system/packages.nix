
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
      unrar
      unzip
      ntfs3g
  ];
}
