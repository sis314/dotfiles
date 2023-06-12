vim.opt.title = false

if vim.g.neovide then
  require("neovide")
end

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
