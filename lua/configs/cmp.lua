local status, cmp = pcall(require, "cmp")
if not status then
    return
end
local complete
local lspkind = require("lspkind")

vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#83a598", fg = "#2e343b", bold = true })
vim.api.nvim_set_hl(0, "MyPmenu", { bg = "#363646", fg = "White" })
vim.api.nvim_set_hl(0, "MyDoc", { bg = "#363646", fg = "White" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#84a598" })

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#7FB4CA", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#7FB4CA", bg = "NONE" })

local icons = {
    Class = " ",
    Color = "  ",
    Constant = "  ",
    Constructor = " ",
    Enum = " ",
    EnumMember = "  ",
    Field = " ",
    File = "  ",
    Folder = "  ",
    Function = " ",
    Interfase = "  ",
    Keyword = " ",
    Method = " ",
    Module = "  ",
    Operator = " ",
    Property = "  ",
    Reference = " ",
    Snippet = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = "  ",
    Value = "  ",
    Variable = " ",
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
        ["<Tab>"] = cmp.mapping.confirm({
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
            winhighlight = "Normal:MyDoc,FloatBorder:MyDoc",
        }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip",  priority = 750 },
        { name = "buffer",   priority = 500 },
        { name = "path",     priority = 250 },
    }),
    experimental = {
        ghost_text = true,
    },

    formatting = { --https://github.com/hrsh7th/nvim-cmp/issues/980
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
            mode = "symbol",
            symbol_map = icons,
            maxwidth = 40,
            ellipsis_char = "…",
            before = function(entry, vim_item)
                local min_width = 40
                local abbr = vim_item.abbr
                if string.len(abbr) < min_width then
                    local padding = string.rep("", min_width - string.len(abbr))
                    vim_item.abbr = abbr .. padding
                end

                local item = entry:get_completion_item()
                local detail_width = 30
                if item.detail then
                    local label = item.deteil
                    local truncated_label = vim.fn.strcharpart(label, 0, detail_width)
                    if truncated_label ~= label then
                        vim_item.menu = truncated_label .. "…"
                    elseif string.len(label) < detail_width then
                        local padding = string.rep(" ", detail_width - string.len(label))
                        vim_item.menu = label .. padding
                    end
                else
                    vim_item.menu = string.rep("", detail_width)
                end
                return vim_item
            end,
        }),
    },
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault

]])
