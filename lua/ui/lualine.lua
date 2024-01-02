local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
    globalstatus = true,
    icons_enabled = true,
    --theme = "sonokai",
    --theme = "seoul256",
    component_separators = { left = "", right = " " },
    section_separators = { left = "", right = " " },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { { "mode" } },
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        path = 1,
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = "󱤅 ", other = "󰠠 " },
        colored = true,
        padding = 2,
      },
    },
    lualine_y = {},
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})
