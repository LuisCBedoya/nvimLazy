require('material').setup({
  disable = {
    colored_cursor = true, -- Disable the colored cursor
    borders = false, -- Disable borders between verticaly split windows
    background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
    term_colors = true, -- Prevent the theme from setting terminal colors
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  lualine_style = 'stealth',
})

vim.g.material_style = 'deep ocean'
-- vim.g.material_style = 'darker'
-- vim.g.material_style = 'palenight'
-- vim.g.material_style = 'oceanic'
-- vim.g.material_style = 'lighter'
