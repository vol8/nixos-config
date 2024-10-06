local opt = vim.opt
local g = vim.g

vim.cmd [[
    map ; :
]]

g.mapLeader = ' '

opt.number = true
opt.cursorline = true
opt.incsearch = true

opt.smartindent = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.viminfo = ""
opt.viminfofile = "NONE"
