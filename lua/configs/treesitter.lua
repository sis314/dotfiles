local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

require("nvim-treesitter.install").compilers = { "zig" }

ts.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    ensure_installed = {
        "c",
        "c_sharp",
        "cpp",
        "css",
        "haskell",
        "html",
        "javascript",
        "json",
        "latex",
        "lua",
        "markdown",
        "python",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "xml",
        "yaml",
    },
    rainbow = {
        enable = true,
        disable = { "html" },
        extended_mode = false,
        max_file_lines = nil,
    },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
