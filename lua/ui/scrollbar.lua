local status, bar = pcall(require, "scrollbar")

if not status then
  return
end

bar.setup({
  handle = {
    text = " ",
    blend = 0,
    culor = nil,
    color_nr = nil,
    highlight = "lualine_c_normal",
  },
  marks = {
    Cursor = {
      text = " ",
    },
    Error = {
      text = { " ", " " },
    },
    Warn = {
      text = { " ", " " },
    },
    Hint = {
      text = { " ", " " },
    },
    Misc = {
      text = { " ", " " },
    },
    GitAdd = {
      text = "",
    },
    GitChange = {
      text = "",
    },
    GitDelete = {
      text = "",
    },
  },
  handlers = {
    cursor = false,
  },
})
