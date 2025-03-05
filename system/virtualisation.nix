
{ ... }:

{
#########################
#     FUCKING VMs       #
#########################

  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
    guest = {
      enable = true;
      dragAndDrop = true;
    };
  };
}
