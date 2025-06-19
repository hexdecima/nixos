{
  outputs = inputs:
    let
      inherit (inputs) stable;
      systems = [ "x86_64-linux" "aarch64-linux" ];
      eachSystem = f:
        stable.lib.genAttrs systems (system: f stable.legacyPackages.${system});
    in {
      nixosConfigurations = import ./hosts inputs;
      homeManagerModules = import ./common/homeManagerModules;
      devShells = eachSystem (pkgs: {
        default = pkgs.mkShellNoCC {
          buildInputs = with pkgs; [ nil nixfmt-classic treefmt nufmt taplo ];
        };
      });
    };

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nixprs.url = "github:hexdecima/nixprs";
    patchy.url = "github:hexdecima/patchy";

    nix-alien.url = "github:thiagokokada/nix-alien";
    wayland.url = "github:nix-community/nixpkgs-wayland";
    lix = {
      url =
        "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0-3.tar.gz";
      inputs.nixpkgs.follows = "stable";
    };
    home.url = "github:nix-community/home-manager/release-25.05";
    # pinned for refusing to playback things crimes.
    zen-flake.url = "github:0xc000022070/zen-browser-flake/7de16ae319e6f6852274fa90b0d41c00049767c9";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "unstable";
    };
  };
}
