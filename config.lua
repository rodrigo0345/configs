-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- -- Disable <ESC>jk for moving code around in normal and insert modes
lvim.keys.normal_mode["<Esc>jk"] = false
lvim.keys.visual_mode["<M-j>"] = false
lvim.keys.visual_mode["<M-k>"] = false

-- add wrap text
lvim.keys.normal_mode["<leader>w"] = ":set wrap!<CR>"

-- Configure Shift+J and Shift+K to move selected lines down and up in visual mode
lvim.keys.visual_mode["<S-k>"] = ":m '<-2<CR>gv=gv"
lvim.keys.visual_mode["<S-j>"] = ":m '>+1<CR>gv=gv"

vim.opt.clipboard = 'unnamedplus'
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<leader>P', '"+P')

-- change the theme
lvim.colorscheme = "catppuccin-mocha"

lvim.transparent_window = true

-- Plugin configurations
lvim.plugins = {
  { "tpope/vim-fugitive" },
  { "mfussenegger/nvim-dap" },
  { "mg979/vim-visual-multi" },
  { 'hkupty/iron.nvim' },
  { "catppuccin/nvim",       name = "catppuccin", priority = 1000 }, {
  "stevearc/dressing.nvim",
  config = function()
    require("dressing").setup({
      input = { enabled = false },
    })
  end,
},
  {
    "nvim-neorg/neorg",
    ft = "norg",
    config = function()
      require("neorg").setup({})
    end,
  },
  {
    'neovim/nvim-lspconfig',
    event = "VeryLazy",
  },
  { "jay-babu/mason-nvim-dap.nvim" },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" }
    -- build = "yay -S glow"
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  { "oberblastmeister/neuron.nvim" },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
    end
  },
  {
    'IogaMaster/neocord',
    event = "VeryLazy"
  }
}

vim.g.VM_maps = {
  ['Find Under'] = '<C-n>',         -- Start multi-cursor with Ctrl+n
  ['Find Subword Under'] = '<C-n>',
  ['Select All'] = '<C-A>',         -- Select all occurrences with Ctrl+A
  ['Add Cursor Down'] = '<C-Down>', -- Add cursor below with Ctrl+Down
  ['Add Cursor Up'] = '<C-Up>',     -- Add cursor above with Ctrl+Up
}

require('lspconfig').ocamllsp.setup{}

require("neocord").setup({
  logo =
  "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExbDNnc3VxcmVhaWV4OGc0a2RheTY5M2prM3lha2Nna204M3M4OGJkbCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/DwT7b7sCkCeHhUTDXo/giphy.gif",
  logo_tooltip = "NeoVim ftw",
  main_image = "logo",
  client_id = "1157438221865717891",
  log_level = nil,
  debounce_timeout = 10,
  blacklist = {},
  file_assets = {},
  show_time = true,
  global_timer = true,
  enable_line_number = true,
  editing_text = "Editing %s",
  file_explorer_text = "Browsing %s",
  git_commit_text = "Committing changes",
  plugin_manager_text = "Managing plugins",
  reading_text = "Reading %s",
  workspace_text = "Working on %s",
  line_number_text = "Line %s out of %s",
  terminal_text = "Using Terminal",
})

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
}

require("lvim.lsp.manager").setup "tailwindcss"

vim.api.nvim_exec([[
  augroup SuppressUndefinedParserError
    autocmd!
    autocmd BufRead,BufNewFile * silent! lua vim.api.nvim_command('set errorformat=')
  augroup END
]], false)

local lspconfig = require("lspconfig")

-- Clangd LSP Configuration
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    require("lvim.lsp").common_on_attach(client, bufnr)
  end,
  capabilities = require("lvim.lsp").common_capabilities(),
}

-- DAP Configuration for C++
local dap = require('dap')

dap.set_log_level('DEBUG')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-dap', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- If you change runInTerminal to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Failed to attach: ptrace(PTRACE_ATTACH, ...): Operation not permitted
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}

-- Set DAP for C and Rust using the same configuration as C++
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<C-a>", -- Change from <Tab> to <C-Space>
    clear_suggestion = "<C-]>",
    accept_word = "<C-j>",
  },
  ignore_filetypes = { cpp = false },
  log_level = "info",                -- set to "off" to disable logging completely
  disable_inline_completion = false, -- disables inline completion for use with cmp
  disable_keymaps = false            -- disables built-in keymaps for more manual control
})
