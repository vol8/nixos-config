{
    description = "Flake for Vol's NixOS configs.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix.url = "github:danth/stylix"; # Global color schemes
    };

    outputs = { nixpkgs, ... } @ inputs: let
        system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
            permittedInsecurePackages = [];
            allowUnfree = true;
        };
    };
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs pkgs; };
            modules = [
                ./configuration.nix
                    inputs.stylix.nixosModules.stylix
            ];
        };
    };
}
