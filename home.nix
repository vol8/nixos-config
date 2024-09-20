{ configs, config, pkgs, inputs, lib, ... }:
{
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
  
	home.file.".i3" = {
        	source = ./dotfiles/i3;
  		onChange = ''
        		${pkgs.i3}/bin/i3-msg reload
      		'';
    	};

	#xdg.configFile."i3blocks".enable = true;
	#xdg.configFile."i3blocks".source = ./dotfiles/i3blocks/config;

	services.picom = {
		enable = true;
		backend = "glx";
		fade = true;
		fadeDelta = 4;
		shadow = true;
		shadowOffsets = [
			(-15)
			(-15)
		];
		shadowOpacity = 0.8;

		settings = {
			blur = { 
			  method = "dual_kawase";
			  size = 3;
			  deviation = 5.0;
			};

			opacity-rule = [
				"85:class_g = 'alacritty'"
				"85:class_g = 'vesktop'"
				"85:class_g = 'rofi'"
			];
		};
	};

	programs.zsh = {
		enable = true;
	    	enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

 		shellAliases = {
      			ll = "ls -l";
      			update = "sudo nixos-rebuild switch --flake .";
		};
	    	
		history = {
			size = 10000;
			path = "${config.xdg.dataHome}/zsh/history";
		};

		oh-my-zsh = {
			enable = true;
			#theme = "risto";
			theme = "simple";
		};
	};

	programs.alacritty = {
		enable = true;
		settings = builtins.fromTOML (builtins.readFile ./dotfiles/alacritty/alacritty.toml);
	};

	home.file = {};

	home.sessionVariables = {};

	programs.home-manager.enable = true;
}
