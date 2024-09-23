inputs@{ stable, unstable, lix, ... }:
let
  # for pulling packages from the unstable repository easily.
  unstableFor = system:
    import unstable {
      inherit system;
      config.allowUnfree = true;
    };
  # for sharing inputs with the home manager configuration.
  homeModulesWith = specialArgs: {
    imports = [ inputs.home.nixosModules.home-manager ];
    home-manager = {
      extraSpecialArgs = specialArgs;
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
  mkGenericSystem = {
    aarch64Linux = modules:
      stable.lib.nixosSystem (let
        system = "x86_64-linux";
        unstable = unstableFor system;
        specialArgs = { inherit inputs system unstable; };
      in {
        inherit specialArgs;
        modules = modules ++ [
          lix.nixosModules.default
          inputs.nix-index-database.nixosModules.nix-index
          (homeModulesWith specialArgs)
        ];
      });
  };
in { kirisame = mkGenericSystem.aarch64Linux [ ./kirisame ]; }
