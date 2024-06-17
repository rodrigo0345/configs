local cmp = require("cmp")

-- Use the system clipboard
vim.opt.clipboard:append('unnamedplus')

-- Map space + y to copy to clipboard
vim.api.nvim_set_keymap('n', '<Space>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Space>y', '"+y', { noremap = true, silent = true })

require("luasnip.loaders.from_vscode").lazy_load()

vim.g.user_emmet_settings = {
  javascript = {
    extends = 'jsx'
  },
  javascriptreact = {
    extends = 'jsx'
  },
}
vim.g.user_emmet_mode = 'i'


cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(), -- Add this line for Ctrl + Space
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'emmet_vim' },
    -- Disable text source by not including it in the sources
  }, {
    { name = 'buffer' },
  }),
})

require("luasnip.loaders.from_vscode").lazy_load()
