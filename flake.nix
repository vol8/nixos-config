{
  description = "Flake for Vol's NixOS configs.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-unstable-small.url = "github:NixOS/nixpkgs/nixos-unstable-small";

    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, ... } @ inputs: let
    system = "x86_64-linux";
    unstable-small-pkgs = import inputs.nixos-unstable-small {inherit system;};
    xdphOverlay = final: prev: {
      inherit (unstable-small-pkgs) xdg-desktop-portal-hyprland;
    };
    pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [xdphOverlay];
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
