local M = {
  'RRethy/vim-illuminate',
  opts = {
    filetypes_denylist = {
      'help',
      'alpha',
      'neo-tree',
      'NvimTree',
      'Trouble',
      'lazy',
      'norg',
    },
  },
  config = function(_, opts)
    require('illuminate').configure(opts)

    -- use background highlight
    vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'Visual' })
  end,
  event = 'VeryLazy',
}

return M
