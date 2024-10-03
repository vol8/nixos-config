{ configs, config, pkgs, inputs, lib, ... }:

{
	imports = [ 
		inputs.nixvim.homeManagerModules.nixvim
    ./modules/zsh.nix
    ./modules/nvim.nix 
    ./modules/picom.nix
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
  
	home.file.".i3" = {
    source = ./dotfiles/i3;
  	onChange = ''${pkgs.i3}/bin/i3-msg reload'';
  };
	
	programs.alacritty = {
		enable = true;
		settings = builtins.fromTOML (builtins.readFile ./dotfiles/alacritty/alacritty.toml);
	};

	programs.neovim.enable = false;

	programs.firefox.enable = true;
	programs.rofi.enable = true;
  programs.obs-studio.enable = true;

	home.file = {};

	home.sessionVariables = {};

	programs.home-manager.enable = true;
}
