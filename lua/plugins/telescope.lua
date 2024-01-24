local telescopeConfig = require('telescope.config')
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
local actions = require('telescope.actions')

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, '--hidden')
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
        ['<ESC>'] = actions.close,
        ['<CR>'] = actions.select_default + actions.center,
      },
      n = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
    file_ignore_patterns = {
      'node_modules/',
      '.git/',
    },
    vimgrep_arguments = vimgrep_arguments,
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { 'rg', '--files', '--hidden' },
    },
  },
})
