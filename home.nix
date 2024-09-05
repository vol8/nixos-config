{ configs, pkgs, ... }:

{
	
	home.username = "vol";
	home.homeDirectory = "/home/vol";

	home.stateVersion = "24.05";

	fonts.fontconfig.enable = true;

	home.packages = [
    	  (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
	];

	# Catppuccin Themes
	catppuccin = {
		enable = true;
		flavor = "macchiato";
		accent = "peach";
		pointerCursor = {
			enable = true;
			flavor = "macchiato";
			accent = "peach";
		};
	};

	gtk.catppuccin.enable = true;
	gtk.catppuccin.accent = "peach";
	gtk.catppuccin.flavor = "macchiato";
	gtk.catppuccin.icon.enable = true;
	gtk.catppuccin.icon.accent = "peach";
	gtk.catppuccin.icon.flavor = "macchiato";
	programs.neovim.catppuccin.enable = true;
	programs.neovim.catppuccin.flavor = "macchiato";


	home.file = {};

	home.sessionVariables = {};

	programs.home-manager.enable = true;
}
