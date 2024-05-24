require("gitsigns").setup()

-- add on init

vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", {})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
