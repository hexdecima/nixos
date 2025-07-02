{
  imports = [ ./firewall.nix ./ssh.nix ./vpn.nix ./dns ./bluetooth.nix ];
  networking = {
    hostName = "kirisame";
    networkmanager.enable = true;
  };
}
