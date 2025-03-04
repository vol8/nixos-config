{ pkgs, config, ... }:

{
    programs.zsh = {
	    enable = true;
      	enableCompletion = true;
      	syntaxHighlighting.enable = true;
	    autosuggestion.enable = true;

       	shellAliases = {
   	    	ll = "ls -l";
   		    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config/";
            rebuild-upgrade = "rebuild --upgrade";
            homec = "nvim ~/nixos-config/home.nix";
            confc = "nvim ~/nixos-config/configuration.nix";
            gotoconf = "cd ~/nixos-config";
            m = "musikcube";
            
            mj = "make -j";
            boot = "mgba-qt pokeemerald.gba";
            mjboot = "mj && boot";

            heatrun = "make -j agbcc && mgba-qt pokemagma.gba";
	    };
	    	
      	history = {
	    	size = 10000;
	  	    path = "${config.xdg.dataHome}/zsh/history";
      	};

    	oh-my-zsh = {
  	        enable = true;
		    theme = "gentoo";
    	};
    };
}
