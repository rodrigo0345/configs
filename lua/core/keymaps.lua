vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = 'indent,eol,start'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.api.nvim_set_keymap('n', '<Space>/', '<Plug>CommentaryLine', {silent = true})
vim.api.nvim_set_keymap('x', '<Space>/', '<Plug>Commentary', {silent = true})
