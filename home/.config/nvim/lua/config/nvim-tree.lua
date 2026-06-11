local M = {}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

function M.on_attach(bufnr)
    local api = require 'nvim-tree.api'

    local function handle_expand_until(expansion_count, node)
        return false
    end

    local function opts(desc, optional_name, optional_value)
        local opts_final = { 
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
        if optional_name ~= nil and optional_value ~= nil then
            opts_final[optional_name] = optional_value
        end
        return opts_final
    end

    vim.keymap.set('n', '<ESC>', api.tree.close, opts('Close tree'))
    vim.keymap.set('n', 'q', api.tree.close, opts('Close tree'))

    vim.keymap.set('n', 'e', api.node.open.edit, opts('Expand'))
    vim.keymap.set('n', 'E', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', 'c', api.node.collapse, opts('Collapse'))

    vim.keymap.set('n', 'n', api.fs.create, opts('Create file or directory with prefix /'))
    vim.keymap.set('n', '<f2>', api.fs.rename_full, opts('Rename node'))
    vim.keymap.set('n', 'r', api.fs.rename_full, opts('Rename node'))

    print(opts('test', {expand_until=handle_expand_until}).expand_until, bufnr)
end

return M
