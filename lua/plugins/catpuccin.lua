require('catppuccin').setup({
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  -- background = { -- :h background
  --   light = 'latte',
  --   dark = 'mocha',
  -- },
  transparent_background = true,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
    loops = { 'italic' },
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
    mocha = {
      base = '#000000',
      mantle = '#000000',
      crust = '#000000',
    },
  },
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = false,
    nvimtree = true,
    telescope = true,
    notify = true,
  },
})
