{
  description = "Flake for Vol's NixOS configs.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, ... } @ inputs: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [
			./configuration.nix
			inputs.stylix.nixosModules.stylix
		];
	};
  };
}
