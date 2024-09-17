{ configs, config, pkgs, inputs, lib, ... }:

let
  mod = "Mod4";
  i3Config = ./i3/config;
in {
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
  
 	xsession.windowManager.i3 = {
		enable = true;
		# package = pkgs.i3-gaps;

		config = builtins.readFile (builtins.toFile "i3-config" "/home/vol/nixos-config/config");
		# config = {
		#	defaultWorkspace = "workspace 1";
		#	modifier = "Mod4";
		#	fonts = [ "JetBrainsMono" ];
		#
		#	keybindings = lib.mkOptionDefault {
		#		"${mod}+p" = "exec ${pkgs.dmenu}/bin/dmenu_run";
		#		"${mod}+w" = "exec firefox-devedition";
		#		"${mod}+Return" = "exec alacritty";
		
				# WORKSPACES
		#		"${mod}+1" = "workspace 1";
		#		"${mod}+2" = "workspace \"2: web\"";
		#		"${mod}+3" = "workspace 3";
		#		"${mod}+4" = "workspace 4";
		#		"${mod}+5" = "workspace 5";
		#		"${mod}+6" = "workspace 6";
		#		"${mod}+7" = "workspace 7";
		#		"${mod}+8" = "workspace 8";
		#		"${mod}+9" = "workspace 9";
		#		"${mod}+0" = "workspace 10";
		#	};

		#	gaps = {
		#		inner = 10;
		#		outer = 5;
		#	};

		#	window = {
		#		titlebar = false;	
		#	};
		#};
	};

	services.picom = {
		enable = true;
		backend = "glx";
		fade = true;
  		#vSync = true;
		settings = {
			opacity-rule = [
				"85:class_g = 'alacritty'"
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
			theme = "risto";
		};
	};
  

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
  programs.zsh.syntaxHighlighting.catppuccin.enable = true;
  programs.zsh.syntaxHighlighting.catppuccin.flavor = "macchiato";


	home.file = {};

	home.sessionVariables = {};

	programs.home-manager.enable = true;
}
