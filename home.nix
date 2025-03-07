{ configs, config, pkgs, inputs, lib, ... }:

{
	imports = [ 
    	./modules/default.nix
	];

	home.username = "vol";
	home.homeDirectory = "/home/vol";

    xdg.userDirs = {
	    enable = true;
	    createDirectories = true;
	    desktop = null;
	    download = "${config.home.homeDirectory}/DOWNLOADS";
	    pictures = "${config.home.homeDirectory}/PICS";
	    documents = null;
	    music = null;
	    videos = null;
	    publicShare = null;
	    templates = null;
	};

	home.stateVersion = "24.05";

	fonts.fontconfig.enable = true;

	home.packages = [
    	(pkgs.nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
	];

    # i3
    home.file.".config/i3".source = ./dotfiles/i3;

    programs.alacritty = {
        enable = true;
        settings.window.padding = {
            x = 8;
            y = 8; 
        };
    };

    programs.firefox.enable = true;
    programs.obs-studio.enable = true;

	home.sessionVariables = {};

	programs.home-manager.enable = true;
}
