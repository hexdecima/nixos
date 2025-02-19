{
  imports = [ ./firewall.nix ./ssh.nix ./vpn.nix ./dns ];
  networking = {
    hostName = "kirisame";
    networkmanager.enable = true;
  };
}
