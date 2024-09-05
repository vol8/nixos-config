{ configs, pkgs, ... }:

{
	home.username = "vol";
	home.homeDirectory = "/home/vol";

	home.stateVersion = "24.05";

	fonts.fontconfig.enable = true;

	home.packages = [
    	  (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
	];

	home.file = {};

	home.sessionVariables = {};

	programs.home-manager.enable = true;
}
