local bufferline = require("bufferline")
bufferline.setup({
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    style_preset = { bufferline.style_preset.no_italic, bufferline.style_preset.no_bold },
    numbers = "none",
    indicator = {
      style = "underline",
      icon = "|", -- this should be omitted if indicator style is not 'icon'
    },
    buffer_close_icon = "󰅖",
    modified_icon = "",
    close_icon = "󰅖",
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics_update_in_insert = false,
    color_icons = true,     -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_close_icon = false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
  },
})
