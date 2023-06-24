vim.opt.title = false

if vim.g.neovide then
    require("neovide")
end

vim.o.guifont = "RobotoMono Nerd Font Mono:h14"

require("settings")
require("plugins")
require("maps")
require("scripts.script")

local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
    vim.cmd("colorscheme kanagawa")
else
    return
end
