{ config, ... }:
{
  programs.zsh = {
	  enable = true;
  	enableCompletion = true;
  	syntaxHighlighting.enable = true;
	  autosuggestion.enable = false;

   	shellAliases = {
   			ll = "ls -l";
   			update = "sudo nixos-rebuild switch --flake ~/nixos-config/";
            homec = "nvim ~/nixos-config/home.nix";
            confc = "nvim ~/nixos-config/configuration.nix";
            gotoconf = "cd ~/nixos-config";
            m = "musikcube";
            pm = "~/nixos-config/porymap";
            
            emerbuild = "make -j";
            heatrun = "make -j agbcc && mgba-qt pokemagma.gba";
	  };
	    	
  	history = {
		size = 10000;
	  	path = "${config.xdg.dataHome}/zsh/history";
  	};

	  oh-my-zsh = {
  		enable = true;
		  theme = "simple";
	  };
  };
}
