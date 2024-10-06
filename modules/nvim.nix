{ pkgs, ... }:
{ 
  programs.neovim = {
    enable = true;
    vimAlias = true;

    # Installs packages without an external plugin manager
    plugins = with pkgs.vimPlugins; [
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
            
        {
            plugin = nvim-lspconfig;
            config = ''
                lua << EOF
                require('lspconfig').rust_analyzer.setup{}
                EOF
            '';
        }
    ];

    # - init.lua
    # luafile $HOME/nixos-config/dotfiles/nvim/abcvol.lua     
    extraLuaConfig = ''
        dofile(vim.fn.expand('$HOME/nixos-config/dotfiles/nvim/settings.lua'))
        dofile(vim.fn.expand('$HOME/nixos-config/dotfiles/nvim/lsp.lua'))
    '';
  };
}

