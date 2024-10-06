{
  programs.nixvim = {
	  enable = true;
  	options = {
		  tabstop = 2;
	  	shiftwidth = 2;
  		softtabstop = 2;
	  	expandtab = true;
      number = true;
			relativenumber = false;
		};

    # Makes line numbers the same color as comments
    highlight = {
      LineNr.link = "NonText";
    };

	  plugins = {
      cmp = {
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "latex-symbols"; }
        ];
      };

      lsp = {
        enable = true;
        servers.clangd.enable = true;
        servers.clangd.autostart = true;
  
        servers.rust-analyzer.enable = true;
        servers.rust-analyzer.autostart = true;
      };
      treesitter.enable = true;
	  	telescope = {
  			enable = true;
				keymaps."<leader>f" = "find_files";
			  keymaps."<C-p>" = "git_files";
		  };
	  	lightline = {
  			enable = true;
				settings.colorscheme = "jellybeans"; # No gruvbox theme???
        settings.component_function = { readonly = "LightlineReadonly"; };
		  };
	  };
  };
}
