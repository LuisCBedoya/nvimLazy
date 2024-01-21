vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

-- bufferline next prev
map('n', '<tab>', ':bnext<CR>', { noremap = true, silent = false })
map('n', '<s-tab>', ':bprevious<CR>', { noremap = true, silent = false })
--
-- tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

map('v', 'ñ', '<gv', { noremap = true, silent = true })
map('v', '<leader>ñ', '>gv', { noremap = true, silent = true })

map('i', 'jk', '<ESC>', { noremap = true, silent = false })
map('i', 'jk', '<ESC>', { noremap = true, silent = false })

map('v', 'jk', '<ESC>', { noremap = true, silent = false })
map('v', 'jk', '<ESC>', { noremap = true, silent = false })

map('n', 'v', 'V', { noremap = true, silent = false })

map('n', '<leader>ñ', '>>', { noremap = true, silent = false })
map('n', 'ñ', '<<', { noremap = true, silent = false })

map('n', 't', '%', { noremap = true, silent = false })
map('v', 't', '%', { noremap = true, silent = false })

map('n', 'm', '#', { noremap = true, silent = false })
map('v', 'm', '#', { noremap = true, silent = false })

map('n', '<C-Space>', ':', { noremap = true, silent = false })

map('n', '<A-j>', '<C-W>j', { noremap = true, silent = false })
map('n', '<A-k>', '<C-W>k', { noremap = true, silent = false })

map('n', '<A-h>', '<C-W>h', { noremap = true, silent = false })
map('n', '<A-l>', '<C-W>l', { noremap = true, silent = false })

