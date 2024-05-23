

vim.cmd [[set number]]
vim.wo.relativenumber = true


vim.cmd [[
  augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
    autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
  augroup END
]]

-- Apply the transparency settings immediately
vim.cmd [[
  highlight Normal ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
]]

-- Automatically insert closing brace and parenthesis
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })

-- Move line up
vim.api.nvim_set_keymap('n', 'K', ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move line down
vim.api.nvim_set_keymap('n', 'J', ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

--vim.g['prettier#autoformat'] = 1
--vim.g['prettier#filetypes'] = { 'csharp' }


require("trouble").setup {
    -- Trouble configuration options
    auto_open = false, -- Automatically open Trouble when there are diagnostics
    auto_close = true, -- Automatically close Trouble when there are no diagnostics
    icons = false,
    use_diagnostic_signs = false-- Use the signs defined in the LSP client
}

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>TroubleToggle<CR>', { noremap = true, silent = true })

vim.o.scrolloff = 20
