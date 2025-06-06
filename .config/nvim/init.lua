local Plug = vim.fn['plug#']

vim.cmd [[
	set clipboard+=unnamedplus
	set tabstop=4
	set shiftwidth=4
	highlight Normal guibg=none
  	highlight NonText guibg=none
  	highlight Normal ctermbg=none
  	highlight NonText ctermbg=none
]]

vim.call('plug#begin')

Plug('nvim-treesitter/nvim-treesitter', { branch = 'main' })
Plug('Mofiqul/adwaita.nvim')

vim.call('plug#end')

vim.cmd([[colorscheme adwaita]])
