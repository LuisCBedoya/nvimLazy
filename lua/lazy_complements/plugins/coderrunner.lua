return {
  'CRAG666/code_runner.nvim',
  config = true,
  opts = {
    -- put here the commands by filetype
    -- filetype = rfile,
    -- mode = "term",
    mode = 'float',
    focus = true,
    startinsert = true,
    term = {
      --position = "vert",
      position = 'bot',
      size = 50,
    },
    float = {
      -- Key that close the code_runner floating window
      close_key = '<ESC>',
      -- Window border (see ':h nvim_open_win')
      border = 'rounded',

      -- Num from `0 - 1` for measurements
      height = 0.8,
      width = 0.8,
      x = 0.5,
      y = 0.5,

      -- Highlight group for floating window/border (see ':h winhl')
      border_hl = 'FloatBorder',
      float_hl = 'Normal',

      -- Transparency (see ':h winblend')
      blend = 0,
    },
  },
  vim.keymap.set('n', '<leader>b', ':RunCode<CR>', { noremap = true, silent = false }),
  vim.keymap.set('n', '<leader>bf', ':RunFile<CR>', { noremap = true, silent = false }),
  vim.keymap.set('n', '<leader>bft', ':RunFile tab<CR>', { noremap = true, silent = false }),
  vim.keymap.set('n', '<leader>bp', ':RunProject<CR>', { noremap = true, silent = false }),
  vim.keymap.set('n', '<leader>bc', ':RunClose<CR>', { noremap = true, silent = false }),
  vim.keymap.set('n', '<leader>brf', ':CRFiletype<CR>', { noremap = true, silent = false }),
  vim.keymap.set('n', '<leader>brp', ':CRProjects<CR>', { noremap = true, silent = false }),
}
