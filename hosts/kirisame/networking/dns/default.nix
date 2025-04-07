let enableDnscrypt = false;
in { imports = if enableDnscrypt then [ ./dnscrypt.nix ] else [ ]; }
