local status, cmp = pcall(require, "cmp")
if not status then
	return
end
local complete
local lspkind = require("lspkind")

vim.api.nvim_set_hl(0, "MyCursorLine", {bg = '#83a598', fg = "#2e343b", bold =  true})
vim.api.nvim_set_hl(0, "MyPmenu", {bg = "#363646", fg = "White"})
vim.api.nvim_set_hl(0, "MyDoc", {bg = "#363646", fg = "White"})

vim.api.nvim_set_hl(0, "CmpItemKindText", {fg = "#84a598"})

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {fg = "#7FB4CA", bg = "NONE"})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {fg = "#7FB4CA", bg = "NONE"})
local icons = {
  Class = "",
  Constructor = "",
  Enum = "",
  Field = "",
  Function = "",
  Keyword = "",
  Method = "",
  Operator = "",
  Reference = "",
  Struct = "",
  Text = "",
  Variable = "",
  TypeParameter = "",
  Snippet = "",
} --https://smarttech101.com/nvim-lsp-autocompletion-mapping-snippets-fuzzy-search/

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
    }),
	}),
  window = {
    completion = cmp.config.window.bordered({
      border = "none",
      side_padding = 0,
      winhighlight = "Normal:MyPmenu,FloatBorder:MyPmenu,CursorLine:MyCursorLine,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      border = "none",
      padding = 1,
      winhighlight = "Normal:MyDoc,FloatBorder:MyDoc"
    }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp", priority = 1000 },
    { name = "luasnip", priority = 750 },
    { name = "buffer", priority = 500 },
    { name = "path", priority = 250 },
  }),
  experimental = {
    ghost_text = true,
  },

  formatting = { --https://github.com/hrsh7th/nvim-cmp/issues/980  
    format = function(entry, vim_item)
      --local WIDTH = 50
      --local kind = vim_item.kind --> Class, Method, Variable...
      --local icon = (icons[kind] or "")
      --local label = vim_item.abbr
      --local truncated_label = vim.fn.strcharpart(label, 0, WIDTH)
      --if truncated_label ~= label then
      --  vim_item.abbr = truncated_label .. '…'
      --elseif string.len(label) < WIDTH then
      --  local padding = string.rep(' ', WIDTH - string.len(label))
      --  vim_item.abbr = label .. padding
      --end
      vim_item.kind = vim_item.name 
      return vim_item
    end,
  },
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
