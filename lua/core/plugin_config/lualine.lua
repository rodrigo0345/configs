require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
  },
  sections = {
    lualine_a = {
      {
        "filename",
        path = 1,
      }
    }
  }
}
