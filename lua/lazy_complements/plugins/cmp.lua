local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/vim-vsnip",
		"hrsh7th/vim-vsnip-integ",
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip",

	},
}

M.config = function()
  vim.g.completeopt = 'menu,menuone,noselect,noinsert'


local cmp = require('cmp')
  local symbol_map = {
  Text = "󰉿 ",
  Method = "󰆧 ",
  Function = "󰡱 ",
  Constructor = " ",
  Field = "󰜢 ",
  Variable = "󰘥 ",
  Class = "󰠱",
  Interface = " ",
  Module = " ",
  Property = "󰜢 ",
  Unit = "󰑭",
  Value = "󰎠 ",
  Enum = " ",
  Keyword = "󰌋 ",
  Snippet = " ",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇 ",
  Folder = "󰉋 ",
  EnumMember = " ",
  Constant = "󰭍 ",
  Struct = "󰙅 ",
  Event = " ",
  Operator = "󰆕 ",
}
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = {
    --     winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    --     col_offset = -3,
    --     side_padding = 0,
    --     border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    -- },
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
       ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end,
      {
        "i",
        "s",
      }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }),
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
       format = function(_, item)
      local a = string.rep(" ", 10)
      item.abbr = item.abbr .. a
      item.menu = " " .. item.kind .. " "
      item.kind = " " .. symbol_map[item.kind] .. " "
      return item
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = "luasnip" },
  }, {}),
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  }),
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
end

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end
return M
