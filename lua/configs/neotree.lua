local status, neotree = pcall(require, "neo-tree")

if not status then
  return
end

neotree.setup({
  window = {
    position = "left",
    width = 30,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    nesting_rules = {},
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      follow_current_file = true,
    },
  },
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      default = "*",
      highlight = "NeoTreeFileIcon",
    },
    modified = {
      symbol = "",
      highlight = "NeoTreeModified",
    },
    git_status = {
      symbols = {
        added = "",
        modified = "",
        deleted = "",
        untracked = "",
        ignored = "",
        staged = "",
        conflict = "",
        renamed = "",
        unstaged = "",
      },
    },
  },
  source_selector = {
    winbar = false,
    statusline = true,
  },
})
