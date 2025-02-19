{ pkgs, ... }:
let
  stateDirectory = "dnscrypt-proxy";
  forwarding_rules = pkgs.writeText "dnscrypt-proxy2-forwarding-rules" ''
    lan 10.0.0.1
    home 10.0.0.1
    home.arpa 10.0.0.1
    localdomain 10.0.0.1
    local $DHCP
  '';
in {
  networking = {
    nameservers = [ "::1" ];
    networkmanager.dns = "none";
  };
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      inherit forwarding_rules;
      listen_addresses = [ "[::1]:51" ];
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        minisign_key =
          "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        cache_file = "/var/lib/${stateDirectory}/public-resolvers";
      };
      server_names = [ "mullvad-doh" "nextdns" ];

      ipv6_servers = true;
      require_dnssec = true;
      require_nolog = false;
      require_nofilter = true;
    };
  };
  systemd.services.dnscrypt-proxy2.serviceConfig.StateDirectory =
    stateDirectory;
}
