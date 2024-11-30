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
        transparent-nvim
        vim-vsnip
        cmp-vsnip
        vim-vsnip-integ

        nvim-tree-lua
        nvim-web-devicons
            
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
        dofile(vim.fn.expand('$HOME/nixos-config/dotfiles/nvim/options.lua'))
        dofile(vim.fn.expand('$HOME/nixos-config/dotfiles/nvim/lsp.lua'))

        require("transparent").setup({
            extra_groups = {
                "all",
            },
        })

        require('base16-colorscheme').setup({
            base00 = '#1d1f21', base01 = '#282a2e', base02 = '#373b41', base03 = '#969896',
            base04 = '#b4b7b4', base05 = '#c5c8c6', base06 = '#e0e0e0', base07 = '#ffffff',
            base08 = '#cc6666', base09 = '#de935f', base0A = '#f0c674', base0B = '#b5bd68',
            base0C = '#8abeb7', base0D = '#81a2be', base0E = '#b294bb', base0F = '#a3685a'
        })

        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
        vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
    '';
  };
}

