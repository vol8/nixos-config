{
  description = "Flake for Vol's NixOS configs.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... } @ inputs: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [
			./configuration.nix
			catppuccin.nixosModules.catppuccin
        		{
          			home-manager.users.vol = {
            				imports = [
              					./home.nix
              					catppuccin.homeManagerModules.catppuccin
            				];
          			};
        		}
		];
	};
  };
}
