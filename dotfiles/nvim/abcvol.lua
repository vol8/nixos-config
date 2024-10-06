local opt = vim.opt
local g = g.vim

g.mapLeader = ' '

-- Indentation
opt.smartindent = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Remove viminfo file
opt.viminfo = ""
opt.vininfofile = "NONE"
