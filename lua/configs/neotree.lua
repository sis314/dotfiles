require("neo-tree").setup({
    window = {
        position = "left",
        width = 40,
        mapping_options = {
            norempap = true,
            nowait = true,
        },
        nesting_rules = {},
        filesystem = {
            filtered_items = {
                visible = false,
                hide_dotfiles = false,
                hide_hidden = false,
            },
        },
        buffers = {
            follow_current_file = true,
        },
    },
})
