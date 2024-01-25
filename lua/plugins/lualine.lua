local icons = require('icons')
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- theme = 'material-stealth', -- when material is active
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
    },
    ignore_focus = {
      'neo-tree',
      'NvimTree',
      'fugitive',
    },
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warning,
          info = icons.diagnostics.Information,
          hint = icons.diagnostics.Hint,
        },
      },
    },
    lualine_c = { 'filename' },
    lualine_x = {
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      'filename',
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },

  winbar = {},
})
