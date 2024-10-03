{ config, ... }:
{
  programs.zsh = {
	  enable = true;
  	enableCompletion = true;
  	syntaxHighlighting.enable = true;
	  autosuggestion.enable = false;

   	shellAliases = {
       			ll = "ls -l";
       			update = "sudo nixos-rebuild switch --flake .";
            homec = "nvim ~/nixos-config/home.nix";
            confc = "nvim ~/nixos-config/configuration.nix";
            gotoconf = "cd ~/nixos-config";
            m = "musikcube";
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
