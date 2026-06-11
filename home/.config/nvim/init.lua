require('config.lazy')
require('config.keybinds')

vim.cmd.colorscheme('olive-crt')

vim.o.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.expandtab=true
vim.o.autoindent=true
vim.o.syntax='on'

vim.o.breakindent=true
vim.o.formatoptions='1'
vim.o.lbr=true

vim.g.mapleader = ' '

vim.g.ale_completion_enabled = 1

require('nvim-tree').setup({
    on_attach = require('config.nvim-tree').on_attach
})
