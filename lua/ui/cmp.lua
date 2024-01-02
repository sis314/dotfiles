local status, cmp = pcall(require, "cmp")
if not status then
    return
end
local lspkind = require("lspkind")

--vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#7FBBB3", bg = "NONE" })
--vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#7FBBB3", bg = "NONE" })

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
    complete = {
        --autocomplete = false,
    },
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
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    cmp.confirm()
                end
            else
                fallback()
            end
        end, { "i", "s", "c" }),
    }),
    window = {
        completion = cmp.config.window.bordered({
            border = "none",
            side_padding = 0,
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
        }),
        documentation = cmp.config.window.bordered({
            border = "none",
            padding = 1,
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
        }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip",  priority = 750 },
        { name = "buffer",   priority = 500 },
        { name = "path",     priority = 250 },
        { name = "omni",     priority = 600, ft = "tex" },
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

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" },
            },
        },
    }),
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
]])
