
{...}:

{
##########################
#  FUCKING NETWORK SHIT  #
##########################

 networking = {
    hostName = "swhit";

    interfaces = {
      enp2s0 = {
	useDHCP = true;
      };
    };

    networkmanager.enable = true;
  };
#Open ports in the firewall.
#networking.firewall.allowedTCPPorts = [ ... ];
#networking.firewall.allowedUDPPorts = [ ... ];
#Or disable the firewall altogether.
#networking.firewall.enable = false;
}
