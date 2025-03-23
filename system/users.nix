
{pkgs, ...}:

{
#########################
#    FUCKING USER(S)    #
#########################

  users.users.swhit = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input" "audio" "realtime"];
      shell = pkgs.zsh;
  };

  users.extraGroups.vboxusers.members = [ "swhit" ];
}
