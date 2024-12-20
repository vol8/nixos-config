local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Nvim-Tree
vim.keymap.set('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<C-.>", "<cmd>NvimTreeFocus<CR>", opts)
