require("tabline").setup({
  enable = true,
  options = {
    section_separators = { "", "" },
    component_separators = { "", "" },
  },
})
vim.cmd([[
                set guioptions-=e
                set sessionoptions+=tabpages,globals
            ]])
