
{pkgs, ...}:

{
#########################
#    FUCKING USER(S)    #
#########################

  users.users.swhit = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input"];
      shell = pkgs.zsh;
  };

  users.extraGroups.vboxusers.members = [ "swhit" ];
}
