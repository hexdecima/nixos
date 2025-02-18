{ pkgs, ... }:
let
  stateDirectory = "dnscrypt-proxy";
  forwarding_rules = pkgs.writeText "dnscrypt-proxy2-forwarding-rules" ''
    lan 192.168.1.1
    home 192.168.1.1
    home.arpa 192.168.1.1
    localdomain 192.168.1.1
    local $DHCP
  '';
in {
  networking = {
    nameservers = [ "::1" ];
    networkmanager.dns = "none";
    firewall.extraCommands = let inherit (pkgs) lib;
    in ''
      ip6tables --table nat --flush OUTPUT
      ${lib.flip (lib.concatMapStringsSep "\n") [ "udp" "tcp" ] (proto: ''
        ip6tables --table nat --append OUTPUT \
        --protocol ${proto} --destination ::1 --destination-port 53 \
        --jump REDIRECT --to-ports 51
      '')}
    '';
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
