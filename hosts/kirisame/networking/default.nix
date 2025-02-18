{
  imports = [ ./firewall.nix ./ssh.nix ./vpn.nix ./dns.nix ];
  networking = {
    hostName = "kirisame";
    networkmanager.enable = true;
  };
}
