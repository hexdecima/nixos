let enableDnscrypt = true;
in { imports = if enableDnscrypt then [ ./dnscrypt.nix ] else [ ]; }
