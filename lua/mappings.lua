local opts = { noremap = true, silent = true }
local fopts = { noremap = false, silent = true }
local keymap = vim.keymap.set

keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- -- ***** SAVE AND CLOSE
keymap('n', '<leader>w', '<cmd>w<CR>', opts) -- save buffer
keymap('n', '<leader>q', '<cmd>q<CR>', fopts) -- close current window
keymap('n', '<leader>Q', '<cmd>w<CR><cmd>q<CR>', opts) -- save and close window

-- -- *** INDENT
keymap('v', 'ñ', '<gv', opts)
keymap('v', '<A-ñ>', '>gv', opts)
keymap('n', '<A-ñ>', '>>', opts)
keymap('n', 'ñ', '<<', opts)

-- -- *** ENTER NORMAL MODE
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'jk', '<ESC>', opts)
-- keymap('v', 'jk', '<ESC>',opts)
-- keymap('v', 'jk', '<ESC>',opts)

-- -- -- *** RESIZE WINDOWS
keymap('n', '<C-A-k>', '<cmd> resize +2<CR>', opts)
keymap('n', '<C-A-j>', '<cmd> resize -2<CR>', opts)
keymap('n', '<C-A-l>', '<cmd> vertical resize -2<CR>', opts)
keymap('n', '<C-A-h>', '<cmd> vertical resize +2<CR>', opts)

-- *** MOVE BETWEEN WINDOWS
keymap({ 'n', 't' }, '<C-Left>', '<C-w>h', opts)
keymap({ 'n', 't' }, '<C-Down>', '<C-w>j', opts)
keymap({ 'n', 't' }, '<C-Up>', '<C-w>k', opts)
keymap({ 'n', 't' }, '<C-Right>', '<C-w>l', opts)

-- -- *** SPLIT WINDWS
keymap('n', '<leader>vs', ':vsplit ')
keymap('n', '<leader>ds', ':split ')

-- -- *** SEARCH
keymap('n', '<C-s>', ':/')

-- *** FORMATING
-- keymap('n', '<C-f>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', fopts)

-- -- *** OTHERS
keymap('n', 'v', 'V', opts)
keymap('n', '<C-Space>', ':')
keymap('n', 't', '%', opts)
keymap('v', 't', '%', opts)
keymap('n', 'm', '#', opts)
keymap('v', 'm', '#', opts)
