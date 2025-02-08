{
  outputs = inputs:
    let
      inherit (inputs) stable;
      systems = [ "x86_64-linux" ];
      eachSystem = f:
        stable.lib.genAttrs systems (system: f stable.legacyPackages.${system});
    in {
      nixosConfigurations = import ./hosts inputs;
      homeManagerModules = import ./common/homeManagerModules;
      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [ nil nixfmt-classic treefmt ];
        };
      });
    };

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixprs.url = "git+ssh://git@codeberg.org/hexadecimalhex/nixprs.git";
    patchy.url = "git+https://git@tildegit.org/mai/patchy.git";

    nix-alien.url = "github:thiagokokada/nix-alien";
    wayland.url = "github:nix-community/nixpkgs-wayland";
    lix.url =
      "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-2.tar.gz";
    home.url = "github:nix-community/home-manager/release-24.11";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "unstable";
    };
  };
}
