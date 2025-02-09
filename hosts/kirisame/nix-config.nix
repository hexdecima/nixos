{ pkgs, ... }: {
  nix = {
    package = pkgs.nixVersions.stable;
    settings = rec {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "@wheel" ];
      log-lines = 20;
      connect-timeout = 20;
      download-attempts = 10;
      substituters = [
        "https://cache.nixos.org"
        "https://nixpkgs-wayland.cachix.org"
        "https://nix-community.cachix.org"
        "https://cache.lix.systems"
      ];
      trusted-substituters = substituters;
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
      ];
    };
  };
  nixpkgs.config.allowUnfree = true;
}
