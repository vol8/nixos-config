local opt = vim.opt
local g = vim.g

g.mapLeader = ' '

vim.cmd [[
    map ; :
]]

-- Other
opt.clipboard = 'unnamedplus' -- Use system 'wl-clipboard' for nvim
opt.completeopt = {'menu', 'menuone', 'noselect'} -- Some codecompletion suggestions

-- Tab
vim.opt.tabstop = 4         -- number of visual spaces per TAB
vim.opt.softtabstop = 4     -- number of spacesin tab when editing
vim.opt.shiftwidth = 4      -- insert 4 spaces on a tab
vim.opt.expandtab = true    -- tabs are spaces, mainly because of python

-- UI config
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.splitright = true -- New windows are split horizontal
opt.showmode = true -- TODO: Change this to 'false' after adding statusline plugin or what it's called

-- Searching
opt.incsearch = true    -- search as characters are entered
opt.hlsearch = false    -- do not highlight matches
opt.ignorecase = true   -- ignore case in searches by default
opt.smartcase = true    -- but make it case sensitive if an uppercase is entered

-- Indentation
opt.smartindent = true
opt.autoindent = true
