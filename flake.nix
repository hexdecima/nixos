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
    stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixprs.url = "github:mtlhrt/nixprs";
    quick-stack.url = "github:mtlhrt/quick-stack";
    patchy.url = "git+https://codeberg.org/lilim/patchy.git";

    swayfx.url = "github:willpower3309/swayfx";
    nix-alien.url = "github:thiagokokada/nix-alien";
    wayland.url = "github:nix-community/nixpkgs-wayland";
    lix = {
      url =
        "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "stable";
    };
    home = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "stable";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "unstable";
    };
  };
}
